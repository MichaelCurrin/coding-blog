---
title: Why use a scripting language over plain HTML?
description: Advantages of build a website using Python/PHP/Node.js
tags: javascript html
---

A colleague was looking to build a website using a Python framework and asked this question:

> What would you say is the benefit then, to use something like Django or Flask if you want to build a basic site, if these systems still require html? Why not just use html as is?

Here was my response, with some updates:


## Dynamic content

HTML is static. So you typically need some scripting language (Python/PHP/Node.js) if you want it to change based on user input - such as allowing users or an admin user to upload content (posts, photos) which is stored in a database and then show that to users. Or you can fetch content from another external source (e.g. weather API) before returning the HTML page.


## Templating

HTML needs to have presentation instructions duplicated verbosely (the same styling, navigation bar, etc. used on most pages, with slight differences) and so it is not [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) like typical programming.

This makes it tedious and messy to maintain for site of more than one HTML page. If you use PHP/Python you can write your menu in a template or function one and then reuse it on every page that needs it. So then you separate the content from styling layout.

If you need a site of only **one** page and you are learning HTML, then creating an `index.html` file and serving that on a local server or with Github Pages can work fine. It won't allow users to upload content, but if you need add or update pictures, text, etc. you can do that by editing the `index.html` page and uploading any images to the repo.


## Abstraction

A script language also makes things abstracted - instead of writing out many lines of code to make a slideshow, you reference a ready-made widget in PHP, Python etc. and tell it what images to use (or a folder to use).

If you want to focus on learning HTML and CSS to build a site, then you can build it up from scratch or find a simple HTML template.


## Focus on writing content

If you like writing markdown for italics, heading, bullet points etc. rather than writing HTML, you can also create a single `index.md` with markdown content. See `docs/index.md` here and the linked site https://github.com/MichaelCurrin/gh-pages-no-jekyll This is a very simple example.

For a more complex solution, you can use a static site builder like Jekyll (supported by GitHub Pages). This is elegant solution _static website_, where you write content as markdown files and layout as HTML, then a framework compiles that all to HTML assets which get served.

One advantage is performance - serving HTML files with Apache/Nginx is very efficient. Another is security - there is no public-facing Python/PHP/Node.js server which could get hacked.
