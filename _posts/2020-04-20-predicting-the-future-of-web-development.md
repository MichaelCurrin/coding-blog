---
title: Predicting the future of web development
description: What the programming landscapes look like in the next few years

---
## About the talk

If you are into frontend development or just choosing a language or framework, I'd highly recommended watching this Youtube video:

* Title: [Predicting the Future of the Web Development (2020 and 2025)](https://www.youtube.com/watch?v=24tQRwIRP_w)
* Youtube channel: _Coding Tech_
* Speaker: _Richard Feldman_
* Event: [_ReactiveConf_](https://reactiveconf.com/) _2019 in Prague_
* Length: _29 minutes_

## Key takeaways

Below are some points in the talk which stood out for me.

* Make a **prediction** rather than following blindly (such as choosing most-used popular solution).
* Add **features** that people want, don't check off a list of things you think they want.
* [NPM](https://github.com/MichaelCurrin/learn-to-code/blob/master/en/topics/scripting_languages/JavaScript/node_packages.md) has a **security vulnerability** through the pre- and post-install script commands - [disable this in your config](#npm-security-vulnerability).
* Predictions
  * [TypeScript](https://github.com/MichaelCurrin/learn-to-code/tree/master/en/topics/scripting_languages/TypeScript) will take over the JS world.
  * [Web Assembly](https://github.com/MichaelCurrin/learn-to-code/tree/master/en/topics/scripting_languages/Web%20Assembly) will continue to grow and expand the Web App pie.
  * [NPM](https://github.com/MichaelCurrin/learn-to-code/blob/master/en/topics/scripting_languages/JavaScript/node_packages.md) will last, surviving further problems.
  * [JavaScript](https://github.com/MichaelCurrin/learn-to-code/tree/master/en/topics/scripting_languages/JavaScript) alternatives (e.g. [Elm](https://github.com/MichaelCurrin/learn-to-code/tree/master/en/topics/scripting_languages/Elm)) will stay niche and age well.

I elaborate on the talk in the rest of this post.

## Choosing a technology

* Make a prediction rather than following blindly.
* In 2006, the [LAMP stack](https://en.wikipedia.org/wiki/LAMP_(software_bundle)) was all the rage. The P stood for PHP/Perl/Python. **Perl** was super popular, so the speaker's team went for that.
* Perl's support has **declined** **constantly** since then.
* Therefore it is not about choosing a technology (language, framework) only because everybody is using it (**popularity**). You might overlook a declining trend at the moment or coming up. Rather **make a** **prediction** on its future for the next 5 or 10 years and then choose it.
* And choose it because it will make you **happy**. Including these reasons:
  * Community support
  * Libraries
  * How your teams likes working with it and
  * How easy it is to hire people for that.

## Competitors to JavaScript

* [JavaScript](https://github.com/MichaelCurrin/learn-to-code/tree/master/en/topics/scripting_languages/JavaScript) has **community momentum**. People are already using it and adding to it and learning it.
* Anything that is not JS-related won't dominate.
* [TypeScript](https://github.com/MichaelCurrin/learn-to-code/tree/master/en/topics/scripting_languages/TypeScript)
  * This will likely dominate and in 2025 more people will be writing TypeScript than plain JavaScript. The reason why Perl didn't make it and TypeScript will, is that TypeScript has already grown more popular than Perl and has many adopted or is busy being adopted by most JS frameworks.
  * It does promise safety with **type checking** at compile time, however the speaker makes a point that this can be a false promise if not used well - such as when using a complex nested type which uses `any`. (Or using type checking as a substitute for tests).
* Any technology must be significantly **different** from JavaScript to make it worth using. Like [Elm](https://github.com/MichaelCurrin/learn-to-code/tree/master/en/topics/scripting_languages/Elm), which has its great ecosystem, reduced errors, better performance and smaller output sizes - it also just feels lighter and easier to work with compared with JavaScript. Watch the talk for more motivations around these.
* But if it is different enough from JavaScript, it will be a **barrier** to learn for those already preferring JavaScript, so it won't overtake JavaScript. And that's okay.

### JS dialects

These were described as all "really just JavaScript" when compiled. TypeScript and CoffeeScript have both used that tagline.

* CoffeScript
* [Dart](https://github.com/MichaelCurrin/learn-to-code/tree/master/en/topics/scripting_languages/Dart)
* Babel
* [TypeScript](https://github.com/MichaelCurrin/learn-to-code/tree/master/en/topics/scripting_languages/TypeScript)
* Svelt

### Alternatives to JavaScript

* Closure script - [closurescript.org ](https://closurescript.org)
* Reason ML - [reasonml.github.io](https://reasonml.github.io)
* [Elm](https://github.com/MichaelCurrin/learn-to-code/tree/master/en/topics/scripting_languages/Elm)

## NPM security vulnerability

If you take _one thing_ away from the talk:

The speakers said that NPM has a vulnerability in executing **arbitrary code** on install, using **pre**- and **post-install** commands. This can be used for **malicious** behavior, especially with nested dependencies.

How **disable** that and leave it set:

```sh
npm config set ignore-scripts true
```

Or just disable on an install:

```sh
npm install --ignore-scripts
```

## Adding to your product

* Go for solving use-cases and understanding people's problems.
* Rather thank checking of a a list of features which the developers want t add but no one cares about. Such as when the speaker say that when Elm's output size and performance was _better_ than JavaScript and was further improved, people _weren't impressed_ because they are already used to the drawbacks of JavaScript.

## Other predictions

* [Web Assembly](https://github.com/MichaelCurrin/learn-to-code/tree/master/en/topics/scripting_languages/Web%20Assembly) gives low-level control of the browser behavior and is already used by Elm, Dart and Rust. Web Assembly is going to boost performance on browser UI, including for games.
* **Machine Learning** and **AI** are over-hyped - yes there are great use-cases for them, but the kind of applications for those are not going to be so ground-breaking as people think.
* NPM ecosystem
  * **GitHub packages** might be a good alternative to the NPM packages repository. You can already specify it as a source when installing.
  * **Yarn** or something similar could replace NPM as a tool.
  * But the ecosystem will remain, because it has support. 
  * The NPM site has prevented unpublishing packages, to avoid unexpected errors.