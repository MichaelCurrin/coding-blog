# TensorFlow on a Web API

_2018, Feb 20th_

![Python logo](.img/logos/Python-logo-notext.svg) ![TensorFlow logo](.img/logos/Tensorflow_logo.svg) ![CherryPy logo](.img/logos/cherrypy_logo_resized.png)

Once you've trained your [deep learning](https://machinelearningmastery.com/what-is-deep-learning/) model to accurately classify images into categories, what's next? Make it available to your colleagues, the company or the public internet by integrating into it in a [REST API](https://www.mulesoft.com/resources/api/what-is-rest-api-design) server!

Contents:

- Context
- Business need
- Implementation
- Challenges and learnings
- Further reading


## Context

I am passionate about machine learning and REST APIs, so was excited at the opportunity to design and build the _Data Science API_ server, while working at [Curately](https://curate.ly). I worked closed closely with a colleague who was in the Data Science department and provided the models and machine learning expertise. 

I was grateful to get to share my experiences as a speaker at his [Deep Learning Workshops](https://deeplearningworkshops.com/), covering steps I followed and some of the challenges and learnings which stood out to me. I decided later to turn the slides into this article. The content is targeted at Python developers who have an interest in machine learning and/or web APIs. However, the focus is on the principles rather than the code, so it should be accessible to other developers. I hope these might be useful to others working on similar projects or looking to experiment. We built on project on opensource technology and resources, so we love to share our discoveries with others. 


## Business need

The requirement for the project was to enable users to upload images to the service, provide a set of `(X,Y)` image co-ordinates and then receive the 5 most relevant colors and 5 most relevant themes for that point. Both suggestions are from a fixed sets of options, with 42 themes such as "Women's Fashion", "Gardening" or "Architecture" and 18 colors such as "blue", "silver" or "multi-colored". The aim was to provide these predicted labels as accurately and quickly as a possible, to improve the user's experience as part of a larger content creation and tagging service.

## Implementation

### Model files

![Code to load model](.img/tensorflow_api/tensorflow_code.png)

My colleague in the Data Science department did all the research and training on the machine learning side, then supplied me with two trained TensorFlow "model graph" files, which are both category classifiers.

- `themeClassifier.pb` - _Convolutional Neutral Network_
- `colorClassifier.pb` - _Recurrent Neural Net_

He also provided me with a command-line Python script to do a single prediction with one model at a time. It was great for me to first test and understand the project's most basic components, then build the API functionality around them.

When doing a prediction, a model expects an image which has been cropped - around 80% crop gives good accuracy for themes and a 9x9 pixel image is the required input for the color model. The model prediction returns a set of all the model's nodes, which are ordered from most to least relevant. These IDs can be mapped to human-readable labels in a text file. The probabilities associated with each label are also outputted, to give an idea of how confident the model is in the prediction. These are useful for internal testing.

### Predictions service

![Structure](.img/tensorflow_api/structure.png)

I planned and built a Python REST API service which reads the static model files into memory on start-up using TensforFlow, then waits for images to be sent on requests from users. When it receives an request, it crops the images as required, runs a color prediction and a theme prediction (using a TensorFlow Session) and returns the color results and the theme results in a JSON response. I used Pillow for image cropping and resizing and CherryPy for the API.

The service expects the image to be sent in the body of the request, using either [cURL](https://www.rosehosting.com/blog/curl-command-examples/) on the command-line or a basic HTML upload form. The service also allows a path to an image on the remote server to be specified, since in the main application there are two separate steps for the user to upload the image and then get a prediction for specified co-ordinates.

For this project the _Data Science API_ was not made available publically. It is called internally by the main application server, which handles the system of users, images and labels and gets predictions from the _Data Science API_ when it needs to.


## Challenges and learnings


Here are the most valuable lessons I learned in this project.


### Adapt

Be adaptable in how you handle requests. Start with simple command-line without an API, then make it a web API which has no GUI (so cURL or Python's requests module could be used) and then lastly add on the HTML form for convenience and accessibility. Lastly, you can integrate your predictions service into a larger service. Though you can also back to test the simpler components if you need to find a bug or improve an area.

On computing, reading from a file on the hard disk is slow while reading from memory is fast. This makes a big difference for this project. I found that if I only load an 80MB theme model file into memory for _each_ prediction just when it's needed, then let the memory be freed when the request is done, then the request time for the user will always have a few seconds added to it. Therefore I highly recommending choosing to load models at server start-up and then reuse them on requests. Also, learn how to use Sessions in TensforFlow to manage models and predictions, so you can open and close a Session appropriately to achieve the best performance.


### Improve testing

Instead of rushing to integrate in the larger product, build your API as standalone service which can be demonstrated as a proof of concept and tested independently. Make it easy for non-technical users to use your service, even if it is only for internal testing. Such as by providing a static HTML form on your API, which expects an image and co-ordinates and then does a [POST](https://en.wikipedia.org/wiki/POST_(HTTP)) request to your predictions API endpoint when clicking the Submit button.

![HTML form](.img/tensorflow_api/html_form_example.png)

Choose an image input method which suits the testing process. On production, you might give the remote server the path to an image stored on the same machine, but, for testing a local server, it might be most convenient to provide an image as a binary file in the body of the request (such as when using the HTML form or [uploading an image with cURL](https://medium.com/@petehouston/upload-files-with-curl-93064dcccc76)).


### Integrate safely

When you integrate your predictions service into a larger API or service, consider how to make the system robust, so that the user experience is not broken when an element fails.


#### Performance of the entire system

Look at various real-world scenarios, such as when a single model is used in a prediction, compared with using multiple models to give predictions. On a request, is it more effective to run the predictions as parallel requests, or in series? You will have to look at your situation and run experiments to decide this. 

If your service fits in as part of a larger service of uploading and labeling images and getting the results, what is the total request time from the user's perspective and is this realistic? Don't just measure just the time for your predictions service when used alone.


#### Stability

Consider how a call to your predictions service might fail. Such as if the prediction service is turned off, fails to start, or has a bug. Write code to handle unexpected behavior when it receives an image with partial or no content, or maybe a massive file size, then test your solution. Consider forcing the service to raise a timeout error internally if the predictions service (or the main application service) request takes a longer than a maximum time which you think it acceptable for the user to wait.

Add in escape logic in the main application so that if the predictions service fails for reasons such as the above, it can still return default or empty data for the predictions part of the response instead of aborting and giving the user an error.


### Optimize for production

You can do a lot of useful testing on your local development environment. But remember to test it when it is configured to run like a remote environment. Then later, actually test your service when it has been deployed on a remote development server.

#### Daemonizing

When running your API on a remote server on production, it will likely be running as a background process or "daemon", such that it can run when command-line terminal is closed and the process can be stopped and started by other developers on the server. 

I found that when switching daemon mode on, that I got a strange error. The TensforFlow Session could not find the model in memory. I worked out that this was because the model and the prediction Session were running on _different threads_ (read about threading in Python or CherryPy if you're interested in this). I had to experiment and research the approach of other people on sites like StackOverflow. I found a way to ensure the resources were on the same thread and that I was managing the resources well. A drawback of the solution is that it meant the prediction time became slightly slower, but, at least it runs in daeomize mode and I can still find ways to improve performance.

#### Hardware

Test and benchmark the prediction service times on your local environment (possibly on a low spec machine and running through a VM) and compare with times on a remote development environment. While one or two seconds on my machine is disappointing, getting a prediction in under half a second on a remote service feels much better. The faster time on the remote server is worth bearing in mind when doing tests which might seem slow on your local environment.

#### Scaling

If your service is expected to have many users doing simultaneous request to your server, consider how to simulate this behavior when testing and also if you can build any improvements to balance the incoming requests or use of memory. Perhaps you should load one model multiple times on startup, or maybe duplicate it across threads which are allocated to users. Maybe add a load balancing layer like [nginx](https://www.nginx.com/) in front of your web server.

### Access

Protect against you service being by abused users giving bad data or excessive data, whether intentionally or accidentally. Consider putting a limit on the frequency of requests coming from one user and also limit the dimensions, file size and format of images. Depending on your protect, you might want to restrict public access to your service or require authorization to use it.

### Learn from the feedback loop

Logging of events and performances is important for a project like this, as it tells you where you need improvements and if the improvements you made were effective or not.

#### Performance

Decide on performance metrics and then log them in your server's log files. Log each prediction and which model was used, not just the request to the endpoint. In the message, include the duration to do the prediction. Maybe also log the time it takes to load the model in memory.

Make notes of durations so you have a benchmark of performance at a point in time. Set a target for what you want to achieve. Watch how the metrics change over time, such as increasing the number of requests, using a new version of an existing model, increasing the count or file size of models, changing your Session approach or turning daemonizing on and off.

#### Accuracy

Ultimately, having a fast service means nothing if it doesn't give value for the user. Record the results and accuracy of your predictions service, whether using an automated test, or at least tests by hand.

Perhaps the service's top 5 themes includes an appropriate theme 90% of the time and 80% of the time it gets the number one item spot on. Maybe the color service gets the top 5 items correct 95% of the time, but it performs much lower on certain colors. In my project, the initial iteration of the color classifier performed poorly on obscure items like silver, rose gold, multi-colored and black & white. But when it the model was revised and retrained on more of that kind of data, it performed much better on those items.

Your service might perform well on a set of test images you sourced, but does it provide value in a real life situation? Look at logging what your service predicted and also record what the _users actually choose_ from the selection, to see if the accept or rejected the prediction. If the user overrides the suggestion by choosing something outside of the recommend top 5 values, perhaps your model is not as accurate as your thought, or users are uploading images which are very different from the images you used in training.

---

There are many approaches to this problem, depending on your business needs, tools and experience. Hopefully some of this can benefit you when mixing machine learning and a REST API, or at least opened your mind to some obstacles and opportunities.


## Further reading

- CherryPy docs
    * The [homepage](http://docs.cherrypy.org)
    * Deploy section - [Run as a daemon](http://docs.cherrypy.org/en/latest/deploy.html#id6)
- Flask docs
    * The [homepage](http://flask.pocoo.org/)
- TensorFlow website
    * The [homepage](https://www.tensorflow.org)
    * [Tensorflow Session](https://www.tensorflow.org/api_docs/python/tf/Session)
    * [Tensorflow Serving](https://www.tensorflow.org/serving/) - this was not mentioned previously but is a new way to serve a model on an API and is worth exploring
- Tutorials
    * ["Deploy TensorFlow models in Flask"](https://github.com/benman1/tensorflow_flask)
    * [TensorFlow-Tutorials](https://github.com/Hvass-Labs/TensorFlow-Tutorials) repo - in particular, see [inception.py](https://github.com/Hvass-Labs/TensorFlow-Tutorials/blob/master/inception.py) and how _with_ blocks are implemented, both in the main body and in the `Inception` class’s methods, such as  `.__init__`, `.classify` and `.close`.

## Attribution

- TensorFlow logo
    * By FlorianCassayre (Own work) [CC BY-SA 4.0 (https://creativecommons.org/licenses/by-sa/4.0)], via Wikimedia Commons
- CherryPy logo
    * http://docs.cherrypy.org/en/latest/_static/images/cherrypy_logo_big.png
- Python logo
    * By www.python.org - www.python.org, GPL, https://commons.wikimedia.org/w/index.php?curid=34991651
