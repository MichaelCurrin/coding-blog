---
title: Why you should code and host your own blog site
description: An overview of building a blog without a lot of coding experience

---
This post is for you if you are thinking about building your own blog, but aren't sure if its a good idea or don't know what options are available.

The modern tools available require you to write less code - focus on writing in markdown, add a theme on a top and choose your own CMS. Don't worry so much about the coding.

But you will be able to get a lot more of your site with by using coding skills to customize your site.

## Platforms available

### Externally hosted - less control

There are plenty of popular blogging and website-building platforms out there that make it easy to start writing and publish your content.

For example:

* [medium.com](https://medium.com)
* [dev.to](https://dev.to)
* [wordpress.com](https://wordpress.com)
* [wix.com](https://wix.com)

### Self-hosted - more control

I like building a site using a self-hosted approach. Before self-hosted meant getting a Linux machine in the cloud and manually taking care of deployments, your database and software (like PHP and WordPress versions).

The modern tools available let you push code to GitHub to publish your site. The tools will build and deploy your static site (Jekyll, Gatsby, Hugo, MkDocs) or Single-Page Application (Node app built on React or Vue) and provide the hosting.

There are many tools and programming languages out there to support this. Consider these tools.

* Hosting
  * [GitHub Pages](https://michaelcurrin.github.io/dev-resources/resources/web/github-pages.html)
    * Traditionally built using plain HTML or Jekyll.
    * You can add a more custom flow to use _any_ static site or Single-Page Application that you want.
  * [Netlify](https://netlify.com)
    * Many templates are available as GitHub repos with a one-click-deploy button (assuming you have a Netlify account already).
    * Support statics sites in Node, Python, Hugo, Jekyll, PHP and maybe others.
  * [CloudFare Pages](https://pages.cloudflare.com/)
    * This provides deployment and static site hosting.
    * Separate from CloudFare core, which is just a CDN and WAF for peformance and protection of an existing site.
  * Google Cloud
  * AWS
    * CloudFront (caching) + S3 (storage)
    * AWS Amplify - good for Single-Page Applications, static sites and serverless backends
* CMS
  * [Forestry](https://forestry.io/)
    * This comes with a bunch of templates across programming languages
  * [Netlify CMS](https://www.netlifycms.org/)
  * Jekyll Admin

## Why build your own

There are some advantages to making your own site.

* Own all the content that you write.
* If you go with a static site, you can edit your content as code and store it on GitHub. No need to manage or backup a database. And you can use templating to make it easy to focus on your content and reusing components.
* Add your own CMS system - like Netlify CMS or Forestry.
* Choose your own theme or build your own from scratch.
* Write your own code - markdown, HTML, YAML, Ruby... For example, change the look of your site, add a list of posts to your homepage or build a tag cloud.
* You can find existing themes and plugins, or write your own and even share with the open source community. Or as a paid theme.
* No advertising (Wix and WordPress have their own branding unless you go for premium).
* No paywall to block your fans (like Medium) - I suppose you could add one later if you want.
* Control your own build and deploy flow. Such as with GitHub Actions or Netlify. Typically you build on a commit to your main branch. You can also build on a schedule - I use GH Actions to deploy my Netlify site nightly - [MichaelCurrin/my-github-projects](https://github.com/MichaelCurrin/my-github-projects).
* Netlify and GitHub Pages give you free hosting and great performance for most use-cases.
* Control your own domain. More details below.
* It will take some time, but you can copy and paste your source content in other tools into your self-hosted blog. You can set canonical URLs in either platform to tell crawlers which one is the main one.

## More on domains

Blogs like dev.to and medium.com let you set a username, but you can't rebrand the entire domain.

Sites like Wix and Wordpress let you rebrand with your custom domain - but they are relatively expensive and that adds to the cost of the domain itself.

With a self-hosted option, you have more control.

Use a subdomain on a platform like:

* Netlify
  * _my-app.netlify.app_
* GitHub Pages
  * [_MichaelCurrin.github.io/coding-blog/_](https://MichaelCurrin.github.io/coding-blog/)
  * [MichaelCurrin.github.io](https://MichaelCurrin.github.io)

Or, use your own custom domain, for free. You still have to buy the domain itself, but the tools I like let you plugin your own domain at no cost).

Having a custom domain means all the content going there is for you only and stays with you as you change the underlying code. If you start with blog on an existing site (e.g. _dev.to/my-name_) and you migrate to another platform (self-hosted or not), then you have to start over from scratch for search engines to recognize and rank your custom domain highly.

## Hashnode

A short word on HashNode, a newcomer to the blogging space.

* [hashnode.com](https://hashnode.com/)

They give you the ability to write in their community and interact with other users, like on dev.to site.

But the difference is:

* You can put your own custom domain if you want.
* You can sync all your content with GitHub, so you own all your content as code. This makes it easy to switch to another a platform later, like building your own markdown-based static site.
* It lets you import content from another site like [dev.to](https://dev.to).

I'm no so active on Hashnode, but anyway here is my profile:

* [hashnode.com/@MichaelCurrin](https://hashnode.com/@MichaelCurrin)
