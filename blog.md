---
title: Blog
permalink: /blog/
layout: page
---

Blog posts on my experiences as a developer and advice to others. I am a Python developer so the focus is often on Python.

<ul>
    {% for post in site.posts %}
    <li>
        <h2 class="post-title p-name"><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h2>
        <i>{{ post.description | markdownify }}</i>
        <p class="post-meta">{{ post.date | date: site.short_date }}</p>
    </li>
    {% endfor %}
</ul>
