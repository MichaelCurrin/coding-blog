# Coding Blog
> My blog of experiences and advice around coding, focusing on Python development.

[![Netlify Status](https://api.netlify.com/api/v1/badges/d4ec3365-ab16-4053-a694-2adc9a1c9960/deploy-status)](https://app.netlify.com/sites/elastic-borg-56864d/deploys)

This repo is viewable as a website at [michaelcurrin.github.io/coding-blog/](https://michaelcurrin.github.io/coding-blog/). It was built with _Jekyll_ and hosted with _Github Pages_.

The site's theme is [Midnight](https://github.com/pages-themes/midnight).

## Local development

There are build-time warnings on around the `_includes` folder not recognized by the theme, but this seems okay as that folder is used in this project even if it does not exist in the theme.

### Main site

To setup and run this repo locally, follow this instructions in this [gist](https://gist.github.com/MichaelCurrin/1085ab164550b31272699920b5549d4b). I hope you'll find that useful so you can setup your own static site for whatever you wish.

### Admin view

The Jekyll Admin plugin adds a CSM view for editing content. Any changes saved are done as local uncommitted changes in the repo.

Once the site is running as per section above, you can access the admin URL. Note that no username or password is needed.

- http://localhost:5000/admin

Note that the URL paths is fixed, even if the main site is configured to serve on a subpath.

## Notes

The [github-pages](https://github.com/github/pages-gem) gem is set in the Gemfile so that a Github Pages theme can be used and so that `site.github` can be used in templates. The site still builds to Github Pages without it set in the config. But it is added for consistency and in case it is needed for Netlify (running outside of Github).

That plugin also includes the `jekyll-sitemap` and `jekyll-feed` plugins.
