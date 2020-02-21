---
title: Backend vs Frontend
description:
---

Simplify put, the _frontend_ is what a user sees and the _backend_ is what they don't.

For a web application, the backend includes a web server which receives requests from a user's browser (client) and returns a response. Perhaps after doing some computation or storing data in a database or a request for data already i the database.

The backend server can be running in any language (Python, PHP, Nginx, Apache, Perl, Go, Rust) and use just about any database (MySQL, Postgres, MongoDB, Reddis). The backend will return an HTML response to the user, possibly also serving other assets like JavaScript, CSS or images.

The user's browser receives the HTML response that it requested and then builds the Document Object Model (DOM) to show the user something in the browser window. The DOM can be changed, such as when a script runs (e.g. to add a banner or pop-up) or as a user interacts with the page (e.g. adds input to a form).

Often a user can continue interacting on the browser (the frontend) without an internet connection, but some actions (like visiting another page, submitting a form or fetching more photos as you scroll) will fail without a connection.

Some applications use server-side rendering. Such as using PHP, _Ruby on Rails_ or Python frameworks like _Flask_ or _Django_. These act like a baker who bakes the ingredients and then serves the finished cake to the customer. This would be the HTML with all the text, image links and menus.

In contrast, some application use client-sider rendering. Such as some JavaScript frameworks like _React_ or _VueJS_. These act like someone who the customer a recipe and the the customer has to bake the cake.
