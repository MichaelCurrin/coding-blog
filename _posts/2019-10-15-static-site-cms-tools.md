---
title: Static Site CMS tools
---

Websites, libraries or plugins to create content through a CMS and compile to static HTML pages.

## Forestry

[forestry.io](https://forestry.io)

> Write front-end code with Gatsby, Hugo, Jekyll or Vuepress and push to your Git repo. Forestry will pull in your commits and update the CMS.
> 
> Invite your team to create content in a rich UI. Their updates get committed back without merge conflicts.


## Jekyl Admin

Homepage: [jekyll.github.io/jekyll-admin/](https://jekyll.github.io/jekyll-admin/)
Repo: [jekyll-admin](https://github.com/jekyll/jekyll-admin)

> A Jekyll plugin that provides users with a traditional CMS-style graphical interface to author content and administer Jekyll sites. The project is divided into two parts. A Ruby-based HTTP API that handles Jekyll and filesystem operations, and a Javascript-based front end, built on that API.

Basic steps to get this working locally:

1. Add the gem to your Gemfile.
2. Install gems.
3. Serve Jekyll.
4. Go to `/admin/` URL. This always from the root, so ignore any base URL. Note that you do not have to login.

You cannot get the admin accessible on a Github Pages site. But with some customization, you can access this admin view n Netlify through their Netlify CMS integration for managing user access.

This CMS unfortunately requires a lot of knowledge about the Jekyll ecosystem of liquid/markdown,  functions, layouts and so on. So you might have to write code in your CMS and edit YAML. But this can still make you more productive as a developer using a CMS rather than an IDE.

## Jekyl Manager

Homepage: [ashmaroli.github.io/jekyll-manager/](https://ashmaroli.github.io/jekyll-manager/)
Repo: [jekyll-admin](https://github.com/jekyll/jekyll-manager)

> A repackaged Jekyll Admin fork with some alterations.

This has some extra features which come in useful. See the links for more info. Details for Jekyll Admin above apply here.