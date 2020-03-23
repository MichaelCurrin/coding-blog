---
title: Project reflection
description: ''

---
With my own projects on Github, I am learning a lot about setting goals and using issues and PRs. And doing something in smaller incremental releasable pieces, rather than increasing the scope of a PR with nice-to-haves.

If a task is too big, I get frustrated or stuck or distracted then don't come back to it for a while, or can't remember what I was a doing. So I find small wins better, with a route ahead to what I am trying to achieving that has flexibility so the implementation can change.

I am also learning trade-offs when choosing solutions. I am adding search functionality a project to only show items based on text box input. Vanilla JS works based on this tutorial - [How to search/filter list](https://www.w3schools.com/howto/howto_js_filter_lists.asp). But that is very targeted to certain elements using JS and so takes effort to maintain. Custom fitting it also means it is not so reusable across pages or projects.

I found two libraries that handle it well - [List.js](https://listjs.com/) and [JPList](https://www.jplist.org/). 

JPList has a better docs site but there are a lot of attributes you need to add to elements to get the functionality. While List.js works with minimal CSS classes and a few lines of JS. So I went with that.