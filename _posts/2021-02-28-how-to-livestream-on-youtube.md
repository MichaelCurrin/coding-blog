---
title: How to live-stream on YouTube
description: Stream your webcam or coding session to the world

---
I am only getting into live-streaming for the time but want to share the steps I learn as I go.

You can set up a live session on YouTube for free. There is just some verification to get through and some optional software depending on what you want to stream. I go through these here.


## Sign up for live-streaming

1. Login to YouTube - [youtube.com](https://youtube.com/ "youtube.com").
2. Open YouTube Studio - [studio.youtube.com](https://studio.youtube.com/ "https://studio.youtube.com/").
3. Click _Create_ in the top right.
4. Click _Go live_.
5. You'll have to go through the _Verify_ flow. You will get prompted for your country and phone number and then will get a text message or call to verify that you are not a robot.
6. The dashboard will tell you to wait - _"Ready in 24 hours"_. Come back again and then click _Go live_.


## Setup screen-sharing software

You can do this while you wait for the verification step.

If you only need to stream audio and video with your webcam, you'll probably be fine as you are.

To broadcast your screen, you'll need to install an encoder. As in my case, I want to stream a live coding session and don't care so much about the camera.

Look through the list of _YouTube Live verified encoders_ on this guide:

* [Create a livestream with an encoder](https://support.google.com/youtube/answer/2907883?hl=en&ref_topic=9257984#zippy=%2Csoftware-encoders)

Find one appropriate for your device and operating system. Stick to the _software encoders_ area. There is also a _hardware encoder_ list, but based on the diagram on the page, that won't be needed unless you have a mixing desk or some fancy setup of mics and cameras.

I like the look of the first one on the list, as it works on macOS, Windows, and Linux, and is free and open source.

* [Open Broadcaster Software ®](https://obsproject.com/ "Open Broadcaster Software®️")

1. Download from the homepage or Download page.
2. Install it.
3. When you launch the software, you'll have to give it permissions.

I enabled the use of the _mic_. But I denied the use of _keystrokes across applications. Since I prefer to be more cautious and secure and opt-in only if I need this - maybe to display the keys on the screen as I press them.

To stream with a service like YouTube, you need to supply a secret key.

1. Select _YouTube - RTMP_.
2. Click _Get Stream Key_.
3. You'll get taken to the YouTube Studio dashboard. Get your key from there and paste it into the broadcaster app.

You can also click _Cancel_ if you want to look around the app without streaming yet.

## Set up webcam software

I don't know yet how to set up a webcam.

But this was recommended on _Using a webcam_ section of YouTube's [Streaming tips](https://support.google.com/youtube/answer/2853856?hl=en&ref_topic=9257984#zippy=%2Cusing-a-webcam).

> * You can stream with a laptop and webcam but better equipment results in better live stream quality.
> * You can use a software encoding program like [Wirecast](http://www.telestream.net/wirecastforyoutube/cb-landing.htm) or [Flash Media Live Encoder](http://www.adobe.com/products/flashmediaserver/flashmediaencoder/) (FMLE), or [www.youtube.com/webcam](https://www.youtube.com/webcam)

There are also some tips on that page to follow on to be **safe** when live-streaming.

My guess is that the YouTube webcam option uses the browser and no extra software, as the link goes to the studio.


## Resources

* [Live Streaming & Premieres](https://www.youtube.com/howyoutubeworks/product-features/live/?gclsrc=aw.ds#youtube-live) under YouTube product features.
* [Create a livestream with an encoder](https://support.google.com/youtube/answer/2907883?hl=en&ref_topic=9257984) on YouTube/Google support. For screen-sharing or using an external mic or mixer.
