---
title: Blog platforms
description: Guide to choosing a platform for a new blog

---
## No code solutions

### WordPress.com

WordPress is the world's go-to web site platform - I think 70% of the web or something is on WordPress.

WordPress is built around pages and blog posts. You can build any kind of website there, such as an online business.  
  
It is expensive though if you want to hide the WP branding and WP domain though.

[wordpress.com](https://wordpress.com/ "https://wordpress.com/")

### WordPress self-hosted

You can also go for a self-hosted WordPress site where you setup Linux and a database - that gives you more control over appearance and plugins, but needs more effort to maintain and is less secure.

[wordpress.org](https://wordpress.org/ "https://wordpress.org/")

### Medium.com

A blogging platform for any topic.

Create a profile there, write post and subscribe to a variety of topics to find posts by other members. You might hit a paywall on certain accounts after viewing so many free posts and you visitors might hit that too. 

[medium.com/@michael.currin](https://medium.com/@michael.currin)

### Dev together

A blogging platform specifically around programming and technology. 

You can create a profile and starting making posts and interact with others.

Most of the member posts are around topics like JavaScript, React, Python, coding resources and how to get a tech job or learn a new language or tool.

A lot of writers are beginners in the topics they write about and some have poor English. There are also some awesome experienced writers. So if there is a mix of quality.

[dev.to/michaelcurrin](dev.to/michaelcurrin/)

## Code-based solutions

Here I discuss writing your own blog as code and choosing somewhere to host it.

You don't have to write all the code yourself - if you want to pick a theme and focus on your content, you can do that.

### Content as code

The idea is that you have your code in a private or public repo on GitHub (or BitBucket or GitLab). You own the content - it is stored in your own version control and there is no need to back it up (like if you had a database or some account where you'd worry about losing your posts).

And whenever you push a commit from your machine or make a commit in GitHub, you site will re-deploy.

### Host site

I like using [GitHub Pages](https://pages.github.com/) - a hosting service provided by GitHub. You can also try Vercel, [Netlify](https://netlify.com) or [CloudFare Pages](https://pages.cloudflare.com/).

If you use GitHub Pages, you'll get a domain like this:

[michaelcurrin.github.io/coding-blog](https://michaelcurrin.github.io/coding-blog/ "https://michaelcurrin.github.io/coding-blog/")

Here is the GitHub repo:

[github.com/MichaelCurrin/coding-blog](https://github.com/MichaelCurrin/coding-blog "https://github.com/MichaelCurrin/coding-blog")

You can host plenty of free times on those domains. If you want a custom domain that you already own (e.g. `https://example.com`) , you can usually set that as your domain with no additional cost.

### Static site generators

Instead of writing all the HTML and CSS yourself, you can choose a static site generator. That a tool which uses templating syntax to output an HTML site. It also means you can usually make a simple change to switch between themes. Whether builtin, or community or paid.

I like using _Jekyll_ for most of my sites is very easy to setup on GitHub Pages without any install or build steps - just add content. It is built in Ruby but you don't need to know Ruby syntax - you do have to learn the _Liquid_ templating syntax but you get to use that across programming languages (for example in Python Flask or Django you also use Liquid syntax).

There are plenty of other approaches like using _Gatsby.js_ or _Hugo_. You'll need a custom build step though, like with a GitHub Actions workflow of about 30 lines (to overcome the limitations of the base GitHub Pages environment). Or use Netlify, which is outside of GitHub but requires a config of just a few lines.

### CMS

If you want a friendlier editing experience, you can add a CMS on top of your static site.

Some platforms

* [Netlify CMS](https://www.netlifycms.org/) (requires code configuration)
* [Forestry](https://forestry.io) (no code to setup)
* Jekyll Admin (no code to setup but only works with Jekyll and only locally)