---
title: Static Site CMS tools
---

Websites, libraries or plugins to create content through a CMS and compile to static HTML pages.


## Forestry

Website: [forestry.io](https://forestry.io)

> Write front-end code with Gatsby, Hugo, Jekyll or Vuepress and push to your Git repo. Forestry will pull in your commits and update the CMS.
> 
> Invite your team to create content in a rich UI. Their updates get committed back without merge conflicts.

This come with a few templates and allows you to choose a language. Forestry does not actually build or host your website - it just a pretty CMS view which controls users and editing of content. It does have a preview mode for fast building on a private randomized URL.

I like this and ound this experience similar to the Jekyll Admin view but with more functionality.

Free for use with one user.

## Siteleaf

Website: [siteleaf.com](https://siteleaf.com)

This acts as a CMS for Jekyll sites hosted on Github. I found this difficult to setup the way I wanted and get my head around and it had a few limitations compared with Foresty, so after trying out a few Siteleaf projects I stopped using it.

Changes through Siteleaf create commits in Github. When you have YAML metadata in the frontmatter of your sites, these will be formatted according to Siteleaf's styling, removing any comments. Also, any files without extensions become `.md` files. I didn't what it did to my project.


## Netlify CMS

This section covers approaches which use Netlify to control user access for the application's admin view.

The limitation on number of users is based on your Netlify account and the Netlify site's details. You'll be the admin user and you can invite other users, up to a limit of about 5 I think on the free tier. There is also a way to have 100 users, but that makes that any person who views the site can register, which you may not want.

### Hugo

I used a Netlify CMS quickstart for Hugo. Unfortunately, you cannot run the admin view locally (the admin page points to Netlify) which means content is updated on the remote and not locally. Also, the admin view's content rules and preview ability needs to be maintained and kept in sync with your main application. I found this tedious and too much effort, so I went with another solution. Perhaps there are other ways to use Hugo CMS which are easier.

### Jekyl Admin

Homepage: [jekyll.github.io/jekyll-admin/](https://jekyll.github.io/jekyll-admin/)
Repo: [jekyll-admin](https://github.com/jekyll/jekyll-admin)

> A Jekyll plugin that provides users with a traditional CMS-style graphical interface to author content and administer Jekyll sites. The project is divided into two parts. A Ruby-based HTTP API that handles Jekyll and filesystem operations, and a Javascript-based front end, built on that API.

### Local

Basic steps to get this working locally:

1. Add the gem to your Gemfile.
2. Install gems.
3. Serve Jekyll.
4. Go to `/admin/` URL. This always from the root, so ignore any base URL. 

Benefits:
- You do not have to login, as there are no users. This is simple and easy.
- You can get up and running without code - you do not need to add any config file or HTML file specific to the admin view. The admin view immediately allows you to edit the files in your project easily. 
- YAML files can be edited as text or in a more structured way (though comments will be removed when you save).
- When you save a change in admin view, the files will be updated locally and the site will rebuild.

Limitations:
- Note that the livereload flag will be applied automatically when starting the Jekyll server with this plugin enabled. 
- It will *prevent* rebuilding on changes on files made through the IDE and will only rebuild on changes made through admin UI. This can be inconvenient if you are switching between the admin view and your IDE for editing, but it not too annoying. And I suppose it encourages you to stick to the admin view, although some things are more appropriate or only possible in the IDE view.

### Remote

You cannot get the admin accessible on a Github Pages site. 

With some customization (config file and HTML), you can access this admin view in Netlify through their Netlify CMS integration for managing user access.

### Ease of use

This CMS is probably targeted at developers. It unfortunately requires a lot of knowledge about the Jekyll ecosystem of liquid/markdown, functions, layouts and so on. So you might have to write code in your CMS and edit YAML. But this can still make you more productive as a developer using a CMS rather than an IDE.

From my little spend spent on Foresty, I found that better as a no-code solution.

### Jekyl Manager

Homepage: [ashmaroli.github.io/jekyll-manager/](https://ashmaroli.github.io/jekyll-manager/)
Repo: [jekyll-admin](https://github.com/jekyll/jekyll-manager)

> A repackaged Jekyll Admin fork with some alterations.

This has some extra features which come in useful. See the links for more info. Details for Jekyll Admin above apply here.


## Storyblok

Website: [storyblok.com/](https://www.storyblok.com/)

I've not used this before but came across it through a Storybok Nuxt quickstart repo for Netlify. [storyblok/nuxtwebsite](https://github.com/storyblok/nuxtwebsite)

Free for use with one user.
