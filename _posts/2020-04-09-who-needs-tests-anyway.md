---
title: Who needs tests anyway?
description: The cost of writing tests compared with the cost of NOT writing tests
tags: tdd tests
---

This article is about writing automated tests in a project, such as unit tests or integration tests.

## Why write tests?

Who needs tests? You do, probably. Not always if they impractical, but when it matters. If your application (or the code on Github) will give an error and you don't know about it, is it still okay? How many people will be affected?

Sometimes when prototyping you just need something that works and to reach point to decide if the application is worth adding to. So you might keep tests early on but add them later, to check the functionality is what you expect.

Writing tests upfront even for a simple project can be beneficial. Tests tell you what the application and its pieces should do, so it gives you a checklist of functionality to build - this gives you a higher-level view of your application and means you avoid functionality is not worth coding e.g. If you need to add up all items in an array, maybe don't write a function if you can use a library or even use a builtin function like `sum`.

Look up Test-Driven Development - the tests can guide the developers to make good design choices.

Note that having tests for your functions does not mean the application actually runs or starts or gives a user what they expect. Behavior Driven Development and other testing can help there.

Programmers tend to get bored writing tests as it often doesn't feel like it adds value or takes too long. They might skip them because they forgot, don't know how or just are optimistic that the application will work fine and can be tested by change well enough.

I came across this philosophy:

> Write tests unless you have a really good reason not too.

That attitude starts with a fresh perspective - test everything. Be deliberate if you want to not have tests and reassess that later on. Whether you have tests or not, at the very least test your application locally and on production. Even if you are pretty sure you change worked, there is a risk that something you did was wrong or had an incorrect or implied assumption or something else changed that you did not know about.


## Story of no tests

I had an experience recently on a simple project with no tests. I made a change in Github directly and did not test the code locally because it looked right to me. In fact the syntax was right, but the logic was wrong - referencing a field in SQL that doesn't exist. I didn't even deploy the change straight away.

Then some weeks later I made another change, also not testing locally. I deploy the code and restarted the server and it came up.

The next day I sent someone the link and they said my site was down.

I turned out that there there was a runtime error which happens when the page loads and a call is made to SQL. The error does not when the Python server starts, that's why it seemed okay.

So my plan is to write unit tests for that project to test functions and integration tests that test that the server can do a call to SQL.

At the least, the test should handle the "happy flow", using variation inputs and combinations. As a second priority, if there is any kind of invalid or bad data, then that needs to be handled too in tests.

The test should be run on Github through Github Actions, or Circle CI. This will give me a status check of pass or failing code, without having to run tests locally.

## Story of writing tests for a migration

One very good reason to add or extend tests in a project is before doing a refactor or update.

In my case, I upgraded an application from Python 2 to Python 3. But I had poor test coverage. And its tedious to test by hand with good and bad data and various combinations. Especially if it takes days or weeks to do the change and tests need to be run daily to check everything is still working.

Therefore I find it very valuable to write tests upfront and run them regularly - locally and on a push to Github. I got to check the status of the Pull Request checks to see if everything was okay before merging.

When did the update to Python 3, the tests helped me uncover issues in things that I did not know to watch out for, or where I just made a careless mistake which meant a loss in functionality.


## When not to write tests

I started out a lot of projects without tests and they are usually fine. Some of my projects are on Github are very simple or unimportant - they probably aren't relied upon by anyone and sometimes its just a demo or experiment.

Some projects have mostly **presentation** logic (like a static website page) which would need a lot of overhead to test compared with testing that a function or class or API call works as expected in good situations and edge-cases. The overheard is the test pipeline, the test code and test dependencies and the effort to describe the elegant HTML in terms of code and update tests whenever the frontend changes.

The thing about tests is that they help you in the long run - if you plan to come back to the project in weeks or months from now, the tests give you confidence that things will still work. The tests can also describe the behavior of the functions and show the intent and kind of data you would throw at them.
