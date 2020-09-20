---
title: Home
layout: home
---

<div align="center">
    <a href="{{ site.github.owner_url }}">
        <img src="{{ site.github.owner_url }}.png" alt="My GitHub avatar" title="My GitHub avatar" />
    </a>
</div>
<br>

Welcome to my developer blog - I write about tech topics that interest me, my experience and learnings and advice to others.

My preferred tools are Python, JavaScript and Bash, so language-specific posts are about those often. I also like making static sites and learning to use CMS tools.

Follow me on _dev.to_ - I am post there regularly.

<a href="https://dev.to/michaelcurrin">
    <img src="https://d2fltix0v2e0sb.cloudfront.net/dev-badge.svg" alt="Mike's DEV Profile" height="30" width="30">@michaelcurrin 
</a>

Here is my feed of posts on my own site:

<ul>
    {% for post in site.posts %}
    <li>
        <h2 class="post-title p-name"><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h2>
        
        <i>{{ post.description | markdownify }}</i>
        <p class="post-meta">
            {{ post.date | date: site.short_date }}
        </p>
    </li>
    {% endfor %}
</ul>
