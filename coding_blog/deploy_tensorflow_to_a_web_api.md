# Deploy Tensforflow to a Web API

>How to take a deep learning prediction model and productionise so it, so that it can be used by the business or other users accessing the public REST API. 

This topic something recently implemented and am passionate about, so I grabbed the opportunity when a friend and colleague asked me to talk about this topic as part of [Deep Learning Workshops](https://deeplearningworkshops.com/). This article covers a lot of the content my talk and is targeted at Python developers who have some machine learning or web API experience and want to combine to two fields to produce something powerful and useful.

The requirement was for users to upload images to the service and provide a set of X,Y co-ordinates and then received the 5 most relevant colors and 5 most relevant themes for that point. Both are fixed sets of options, as such themes like "Men's Fashion", "Gardening" or "Architecture", or colors as "blue", "silver" or "multi-colored". The aim was to provide these predicted labels as accurately and quickly as a possible, to improve the user's experience as part of a large service.

I was supplied two trained TensforFlow model graph files, such as `themeClassifier.pb` and `colorClassifier.pb`. When doing a prediction, a model expects a cropped image as input and then returns a set of all nodes. The nodes are ordered from most to least relevant and can be mapped to human-readable labels by using a text file.

I built a Python REST API service which reads the static model files into memory on start-up using TensforFlow, then waits for images for users, crops the images, runs the predictions separately (using a Session in TensorFlow) and returns the color results and the theme results in a JSON response. I used Pillow for image handling and CherryPy for the API (Flask would also work well).

The service expects the image to be sent in the body of the request using cURL on the command-line or an a basic HTML upload form. The service also allows a path to an image on the remote server to be specified, as in production there are two separate steps for the user to upload the image and then get a prediction for specified co-ordinates.

Here are the most valuable lessons I learned in this project.

## Adapt

Be adaptable in how you handle requests. Start with simple command-line without an API, then make it a web API which has no GUI (so cURL or Python's requests module could be used) and then lastly add on the HTML form for convenience and accessibility.

Consider how to load models at server start-up and then reuse them on requests. If you only load a model into memory of possibly 80MB when the prediction event happens, there will be a few seconds extra added to the total time the user waits for the prediction. Also, learn how Sessions in TensforFlow manage models and predictions, so you can open and close a Session appropriately to give the best performance.

## Improve testing

Instead of rushing to integrate in the larger product, build your API as standalone service which can be demonstrated as a proof of concept and tested independently. Make it easy for non-technical users to use your service, such as by providing an HTML interface even if it is only for internal testing. Also, choose an image input method which suits the testing process. On production you might give the remote server the path to an image stored on the same machine, but for testing a local server it might be most accessible to provide an image as a binary file in the body of the request (such as when using the HTML form or cURL).


## Integrate safely

When you integrate your predictions service into a larger API or service, consider how to do this safely. 

### Performance of the entire system

Look at various real-world scenarios such as when a single model is used in a prediction, compared with using multiple models and giving predictions. Is it more effective to run the predictions as parallel requests or in series? If your service fits in as part of a larger service of uploading and labeling images and getting the results, what is the total request time from the user's perspective and is this realistic? Don't just measure just the time for your predictions service alone.

### Stability

For robustness, consider how a call to your predictions service might fail. Such as if the prediction service is turned off, fails to start or has a bug. Or receives an image with partial or no content, or a massive file size. Consider forcing the request to raise a timeout error if the predictions service (or the main application service) takes a longer than a maximum time which you think it acceptable for the user to wait.

Add in escape logic in the main application so that if the predictions service for reasons such as the above, it can still return default or empty data for the predictions part of the response instead of aborting and giving the user an error.

### Optimize for production

You can do a lot of useful testing on your local development environment. But remember to test it when it is configured to run like a remote environment, or test the service running on a remote development server.

#### Daemonizing

When running your API on production it will likely be running as a background process or "daemon", such that it can run when command-line terminal is closed and the process can be stopped and started by other developers on the server. I found that when switching to daemon mode on, that I got a strange error where the TensforFlow Session could not find the model in memory. I worked out that this was because model and the prediction Session were running on different threads (read about threading in Python or CherryPy if you're interested in this). I had to experiment and research the approach of other people on sites like StackOverflow to make sure I was kept the resources on the same thread and that I was managing the resources well.

#### Hardware

Test and benchmark the prediction service times on your local environment (possibly on a low spec machine and running through a VM) and compare with times on a remote development environment. While one or two seconds on my machine is disappointing, getting a prediction in under half a second on a remote service feels much better and is worth bearing in mind when doing tests which might seem slow on your local environment.

#### Scaling

If your service is expected to have many users doing simultaneous request to your server, consider how to simulate this behavior when testing and also if you can build any improvements to balance the incoming requests or use of memory. Perhaps you should load one model multiple times on startup, or maybe duplicate it across threads which are allocated to users.

#### Access

Protect against you service being by abused users giving bad data or excessive data, whether intentionally or accidentally. Consider putting a limit on the frequency of requests coming from one user and also limit the dimensions, file size and format of images. Depending on your protect, you might want to restrict public access to your service or require authorization to use it.

### Learn from the feedback loop

Logging of events and performances is important for a project like this, as it tells you where you need improvements and if the improvements you made were effective or not.

#### Performance

Log performance metrics in your server's log files, such as how long it takes to load a model into memory or to do a prediction. Record the times as benchmarks and set a target for what you want to get. Watch how the metrics change over time such as when uploading an updated version of an existing model, increasing the count or file size of models, changing your Session approach and turning daemonizing on and off.


#### Accuracy

Ultimately, having a fast service means nothing if it doesn't give value for the user. Record the accuracy of your predictions service, whether using an automated test or at least tests by hand. 

Perhaps the service's top 5 themes includes an appropriate theme 90% of the time and 80% of the time it gets the number one item correct. Maybe the color service gets the top 5 items correct 95% of the time, but it performs much lower on certain colors. In my project, the initial iteration of the color classifier performed poorly on obscure items like silver, rose gold, multi-colored and black & white. But when it the model was tweaked and retrained on more of that kind of data, it performed much better on those items.

Your service might perform well on the tests of test data you use, but does it provide value in a real life situation? Look at logging what your service predicted and also record what the user actually chose. If the user override the suggestion by choosing something outside of the recommend top 5 values, perhaps your model is as accurate as your thought or users are uploading images which are very different from the images you used in training.
