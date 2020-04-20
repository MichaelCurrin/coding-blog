---
title: Predicting the future of web development
description: What the programming landscapes look like in the next few years

---
## About the talk

If you are into frontend development or just choosing a language or framework, I'd highly recommended watching this Youtube video:

* Title: [Predicting the Future of the Web Development (2020 and 2025)](https://www.youtube.com/watch?v=24tQRwIRP_w)
* YT channel: Coding Tech
* Speaker: Richard Feldman
* Event: ReactiveConf 2019
* Length: 29 minutes

## Key takeaways

Below are some points in the talk which stood out for me.

* Make a **prediction** rather than following blindly (such as choosing most-used popular solution).
* Add **features** that people want, don't check off a list of things you think they want.
* NPM has a **security vulnerability** through the pre- and post-install script commands - [disable](#npm-security-vulnerability) this in your config. 
* Predictions
  * **TypeScript** will take over the JS world (see [Resources](#resources))
  * **WASM** will continue to grow and expand the Web App pie (see [Resources](#resources))
  * **NPM** will last, surving further problems
  * **JS** **alternatives** (e.g. Elm) will stay niche and age well.

## More details

Here I elaborate on the talk.

### Choosing a technology

* Make a prediction rather than following blindly.
* In 2006, the [LAMP stack](https://en.wikipedia.org/wiki/LAMP_(software_bundle)) was all the rage. The P stood for PHP/Perl/Python. **Perl** was super popular, so the speaker's team went for that.
* Perl's support has **declined** **constantly** since then.
* Therefore it is not about choosing a technology (language, framework) only because everybody is using it (**popularity**). You might overlook a declining trend at the moment or coming up. Rather **make a** **prediction** on its future for the next 5 or 10 years and then choose it.
* And choose it because it will make you **happy**. Including these reasons:
  * Community support
  * Libraries
  * How your teams likes working with it and
  * How easy it is to hire people for that.

### Competitors to JavaScript

* JavaScript has **community momentum**. People are already using it and adding to it and learning it.
* Anything that is not JS-related won't dominate.
* **TypeScript** will likely dominate and in 2025 more people will be writing TypeScript than plain JavaScript. The reason why Perl didn't make it and TypeScript will, is that TypeScript has already grown more popular than Perl and has many adopted or is busy being adopted by most JS frameworks.
* TypeScript does promise safety with **type checking** at compile time, however the speaker makes a point that this can be a false promise if not used well - such as when using a complex nested type which uses `any`. (Or using type checking as a substitute for tests).
* Any technology must be significantly **different** from JavaScript to make it worth using. Like **Elm**, which has its great ecosystem, reduced errors, better performance and smaller output sizes - it also just feels lighter and easier to work with compared with JavaScript. Watch the talk for more motivations around these.
* But if it is different enough from JavaScript, it will be a **barrier** to learn for those already preferring JavaScript, so it won't overtake JavaScript. And that's okay.

#### JS dialects

These were described as all "really just JavaScript" when compiled. TypeScript and CoffeeScript have both used that tagline.

* CoffeScript
* Dart
* Babel
* TypeScript (see [Resources](#resources))
* Svelt

#### Alternatives to JavaScript

* Closure script - [closurescript.org ](https://closurescript.org)
* Reason ML - [reasonml.github.io](https://reasonml.github.io)
* Elm (see [Resources](#resources))

### NPM security vulnerability

If you take _one thing_ away from the talk:

The speakers said that NPM has a vulnerability in executing **arbitrary code** on install, using **pre**- and **post-install** commands. This can be used for **malicious** behavior, especially with nested dependencies.

How **disable** that and leave it set:

    npm config set ignore-scripts true

Or just disable on an install:

    npm install --ignore-scripts

### Adding to your product

* Go for solving use-cases and understanding people's problems.
* Rather thank checking of a a list of features which the developers want t add but no one cares about. Such as when the speaker say that when Elm's output size and performance was better than JavaScript and was further improved, people weren't impressed because they are already used to the drawbacks of JavaScript.

### Other predictions

* Web Assembly gives low-level control of the browser behavior and is already used by Elm, Dart and Rust. Web Assembly is going to boost performance on browser UI, including for games.
* Machine Learning and AI are over-hyped - yes there are great use-cases for them, but the kind of applications for those are not going to be so ground-breaking as people think.
* GitHub packages might be a good alternative to NPM packages repository. Yarn or something else might replace NPM. But the ecosystem will remain because it has support. The NPM site has prevented unpublishing packages, to avoid unexpected errors.

## Resources

### TypeScript

* Homepage [typescriptlang.org](https://www.typescriptlang.org/ "https://www.typescriptlang.org/")
* [Wikipedia](https://en.wikipedia.org/wiki/TypeScript) page

  > TypeScript is an open-source programming language developed and maintained by Microsoft. It is a strict syntactical superset of JavaScript and adds optional static typing to the language. TypeScript is designed for development of large applications and transcompiles to JavaScript.

### Elm

* Homepage[ elm-lang.org](https://elm-lang.org/ "https://elm-lang.org/")
* [Wikipedia](https://en.wikipedia.org/wiki/Elm_(programming_language)) page

  > Elm is a domain-specific programming language for declaratively creating web browser-based graphical user interfaces. Elm is purely functional, and is developed with emphasis on usability, performance, and robustness.

### Web Assembly

aka "WASM"

* Homepage [webassembly.org](https://webassembly.org/ "https://webassembly.org/")
* [Wikipedia](https://en.wikipedia.org/wiki/WebAssembly) page

  > WebAssembly is an open standard that defines a portable binary-code format for executable programs, and a corresponding textual assembly language, as well as interfaces for facilitating interactions between such programs and their host environment.