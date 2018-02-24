# Twitterverse project

>This article is about the purpose of and learnings around my [twitterverse](https://github.com/MichaelCurrin/twitterverse) repo.
>
>_2018, Feb 22nd_

I created my _twitterverse_ repo because I was interested in fetching, storing and reporting on data in the [Twitter API](https://developer.twitter.com/en/docs). Such as [trending topics](https://developer.twitter.com/en/docs/trends/trends-for-location/api-reference/get-trends-place) at locations, or using the [Search API](https://developer.twitter.com/en/docs/tweets/search/overview) to get individual tweets in the past 7 days which match a search query.

Some years ago I started out learning to use the [Twitter API](https://developer.twitter.com/en/docs) in the Twitter _developer console_ - that doesn't seem available anymore on their site, though [apigee](https://apigee.com/console) still provides this functionality. When I started learning Python, I found a way to compose URLs and do queries to get tweet data. Over time, the requests I wanted to do become more complex and also I needed an elegant way to handle rate-limiting. So I moved using to the [tweepy](http://www.tweepy.org/) Python library to access the Twitter API. There are a few [Python libraries for the Twitter API](https://www.quora.com/What-is-the-best-Python-Twitter-library-to-use-with-the-Twitter-API), including [Twython](https://twython.readthedocs.io/en/latest/).

I am aware of [SQLAlchemy](https://www.sqlalchemy.org/) and its popularity, though I implemented the application using [SQLObject](http://www.sqlobject.org/) as the [ORM](https://en.wikipedia.org/wiki/Object-relational_mapping) between Python and the database. That was because I was a lot more familiar with using _SQLObject_ at work and wanted to focus my efforts in one direction for a while. 

I like using an ORM to do complex [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete) operations on your database from within Python script or the iPython console, since the ORM lets you work with tables and records as objects and it takes care of a lot of things for you like _JOIN_ operations. The downside, though, is the speed of execution, since reading and writing (whether to a text file or a database) is a lot slower than doing those operations in-memory. Also, the ORM has to process its own validation rules from within Python, as the rules are not the database schema and cannot be executed in the database layer.

I didn't realize how slow the ORM was compared with native SQL statements until I started growing my project to larger volumes of tweet data. I used `tweepy` to do a search query on the Twitter API to get tweets within the past 7 days. I had a script to fetch the tweet object (including the profile of the author), write the tweet and profile records and then assign each tweet a campaign label and each profile a category label (so I can filter and group the records in my database later). The entire process took nearly 4 hours for a batch of 50 000 tweets. But, I wanted to do it faster.

I decided to optimize the campaign labeling process first. When assigning a campaign label, the script uses the ORM to _insert_ a single record, _get_ the record and then repeat for the each data items, one item at a time. This is inefficient because there is overhead in connecting to the database and executing the query to read or write data. So, instead of handling record individually due to the ORM limitation, I composed a single [INSERT](https://www.w3schools.com/sql/sql_insert.asp) statement in SQL with all the required values. The duration came down from minutes to _less than a second_, which is several orders of magnitude faster. I used the ORM's [SQLBuilder](http://sqlobject.org/SQLBuilder.html) module to do this dynamically for multiple items. 

The logic is in a function named `bulkAssignTweetCampaign` in [tweets.py](https://github.com/MichaelCurrin/twitterverse/blob/feature/fetched_data_to_csv/app/lib/tweets.py), currently on a feature branch. That is called by the `main` function of [searchAndStoreTweets.py](https://github.com/MichaelCurrin/twitterverse/blob/feature/fetched_data_to_csv/app/utils/insert/searchAndStoreTweets.py).

Here is the simplified version of the code.
```python
from sqlobject.sqlbuilder import Insert

from lib import database as db

...

# This is dynamic but fixed here as an example.
campaignID = 2

# Create the INSERT statement using N number of tweetIDs and 
# a constant campaignID value. The tweet_campaign table
# contains pairs of values, in order to map a tweet table ID
# to campaign table ID with a many-to-many relationship.
insert = Insert(
    'tweet_campaign',
    template=['campaign_id', 'tweet_id'],
    valueList=[(campaignID, tweetID) for tweetID in tweetIDs]
)

# Convert the object into a native SQL statement.
SQL = db.conn.sqlrepr(insert)

# The sql statement looks something like this:
"""
INSERT INTO tweet_campaign (campaign_id, tweet_id)
VALUES (2, 10024525), (2, 12532657547), (2, 795445656) ... ;
"""

# I want to ignore duplicates silently, so manually alter this.
SQL = SQL.replace("INSERT", "INSERT OR IGNORE")
# Execute the query using the database connection object.
# Note that this can return a success code. But, unlike using
# the ORM, this does not get any records, as this is just a 
# write operation.
db.conn.query(SQL)
```

Reducing the campaign insert time was only part of the script. I then improved category insert time the same way. I worked out that the next step is inserting tweets and profile objects into the database. That would reduce the entire insertion process to a matter of seconds. 

So now I fetch tweets from the API, and instead of writing out to the database immediately, I append thousands of rows to a CSV location in a staging directory. I write out to the CSV as infrequently as possible, to avoid the cost of the write operation. I write either when hitting a certain number of pages to stop memory usage from growing too much, or when hitting the rate limit window (as that means there is deadtime waiting, which can be used to do a write to a file). 

Once the rows are written to a CSV, the memory can be cleared and the script can fetch the next batch of pages of tweets. Then, when the entire process to fetch tweets and write to a CSV a few times finished, I can do the insert logic in a separate script, reading in from the CSV and writing out to the database with a handful of statements to be executed. This can be done immediately or when run manually later.

With the rate limiting of 480 pages per 15 minute window (using the [Application-only auth](https://developer.twitter.com/en/docs/basics/authentication/overview/application-only)) and a good network and processing speed, I am able to get almost 500 pages every 15 minutes, which is almost 2 000 pages an hour. And one page has up to 100 tweets on it, letting me fetch nearly 200 000 tweets in a hour. That is 4 times the number of records as in the previous case, yet in a quarter of the time, meaning it is 8 times faster. This makes it much easier to get large volumes of tweets into my system. 

I currently have this extract process working well and I am logging the requests to a log file. I can see that each request for 100 tweets takes on average close to 1 second on my laptop. When executing on [PythonAnywhere](https://pythonanywhere.com) as a cloud solution, it only takes about a third of a second per request, due to differences in hardware and internet connectivity speeds.

I worked on my _twitterverse_ repo frequently over a few months. When I took a break from developing my application and actually started using it as a tool  to fetch and report on data, I found that I got faster at identifying bugs and finding new features to add to it. That is something I can apply now across many projects. I choses topic which are relevant to me and the people around me. Such as South African politics (`#ZumaRecall`) or the Cape Town water crisis (`#CapeTownWaterCrisis`, `#CPTWaterCrisis` and `#DayZero`). 

I am continuing to scrape and store data related to topics like this, finding ways to improve the efficiency and thinking of creative ways to visualize in the data in a meaningful way. I'll update this article occasionally as I make progress.
