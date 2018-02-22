# My Projects

This article is around the projects I have hosted as [repositories on my Github profile](https://github.com/MichaelCurrin?tab=repositories). I cover the reason I created them and some learnings and challenges I found while working on them.

## [Developer Configurations](https://github.com/MichaelCurrin/developerConfigurations)

I like to customise the developer software I use. When I customise my work laptop, I want to have a reference online so I can easily apply the settings on my home laptop. And perhaps others can discover something they can apply.

## [git-sandbox](https://github.com/MichaelCurrin/git-sandbox)

This is a repo where I can mess around with commands in git especially around branches and rebasing and not worry about affecting any critical work.

## [learn-to-code](https://github.com/MichaelCurrin/learn-to-code)

I like to write tutorials when I learn to solve a problem with Python, bash, git, Thunderbird or other areas. It is a useful reference when I need to solve the problem again.

I started learning a feature extra coding languages at a beginner level and then write a script or tutorial about what I've learnt. I also give instructions on how to getting started such as running a C, PHP or Ruby script for the first time.

I was amazing to find that C is such as powerful language behind many other languages, including Java, Python, iOS, bash and SQL to name a few. I found it useful to go the root of these languages so I can see what they added. For example, in C there are functions but not classes. Memory is not garbage collected like in Java or Python. There is no boolean (at least in the older versions of C) but an integer can be used instead. 

Quoting works different languages. In Python, the double-quoted `"H"` and single-quoted `'H'` are equivalent and both a create a string. In Java, double-quotes is a `String` type while single-quotes is a `char` type. In C, there is _no_ string type, but, double-quotes allows creation of an array of characters.

```C
char single = 'H';
char multi[10] = "H";
```

In Bash, the double-quotes allows subsitution of variables, while single-quotes is the literal characters.

```bash
echo "$HOME"
/home/michael
echo '$HOME'
$HOME
```

There is no string type, but rather an array of characters.

Each language has its own style and syntax, but often these are borrowed from other languages. For example, `printf` in C is the reason for `printf` in bash. And using the Ruby syntax `puts "Hello world"` to print a string seems weird compared with other modern languages, until you see that C has `putchar('H')` to print a character.

Substuting in values into a string in C and Python is also very similar. `"string %s decimal %d"`.

The increment notation of `i++;` isn't just in Java and JavaScript. It actually goes back at least as far as C.


## [twitterverse]((https://github.com/MichaelCurrin/twitterverse))

I started out learning to the Twitter API in the developer console in the browser, then used Python to do manually composed web requests, then I progressed to using the `tweepy` Python library to access the Twitter API. There are others though, such as `Twython`.

Although I am aware of `SQLAlchemy`, I implemented this repo using `SQLObject` as database ORM since I was a lot more familar with using it at work. The convinenience of using an ORM to do CRUD operations on your database from a Python script or iPython console is amazing. The downside though is the speed, because reading and writing (whether to a text file or a database) is a lot slower than doing those operations in memory. Also, the ORM has to process its own validation rules which are not in the database. Also, the SQL is implemented in C which is very efficient, while the ORM is running in Python which has an interpreted language can never be as fast as the compiled C behind it.

I didn't realise how slow the ORM was compared with native SQL until I started scaling my project. I used `tweepy` to do a search query on the Twitter API to get tweets within the past 7 days about a topic. I have a script to fetch the tweets (which includes the profiles of the authors), write the tweet and profile records and then assign each tweet a campaign label and each profile with a category label. The entire process took nearly 4 hours for the 50 000 tweets. I thought there must be a way to improve on this.

I decided to optimise the campaign labelling process first. Instead of doing an insert of a record individually, I dynamically composed a single INSERT statement in SQL with all the required values. The duration came down from minutes to less than a second.

I worked out that inserting of tweets into the database can also get the same treatment. The approach I decided on was to download tweets and write them out to a CSV occasionally. Then when the entire process is finished I can do the insert logic, which will be quick to execute.

With the rate limiting of 480 pages per 15 minute window (using the Application-only auth), I am able to get about 500 pages every 15 minutes, or about 2000 pages an hour. An one page has up to 100 tweets on it, which means 200 000 tweets. That is 4 times the number of records and in a quarter of the time, meaning it is 8x faster. This makes it much easier to get large volumes of tweets into my system. I currently have this extract process working well and I am logging the requests to a log file. I can see that each request for 100 tweets takes on average close to 1 second on my machine. When executing on [PythonAnywhere](https://pythonanywhere.com) as a cloud solution, it only takes about a third of as second per request.
