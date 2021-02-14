# Coding Blog
> My blog of experiences and advice around coding

[![GitHub tag](https://img.shields.io/github/tag/MichaelCurrin/coding-blog)](https://github.com/MichaelCurrin/coding-blog/tags/)
[![License](https://img.shields.io/badge/License-MIT-blue)](#license)

[![Hosted with GitHub Pages](https://img.shields.io/badge/Hosted_with-GitHub_Pages-blue.svg)](https://pages.github.com/)
[![Made with Jekyll](https://img.shields.io/badge/jekyll-3.9-blue?logo=jekyll)](https://jekyllrb.com)
[![Theme minima](https://img.shields.io/badge/theme-jekyll--theme--midnight-blue)](https://github.com/pages-themes/midnight)


## View site

<div align="center">

[![View site GH Pages](https://img.shields.io/badge/View_site-Coding_Blog-2ea44f?style=for-the-badge)](https://MichaelCurrin.github.io/coding-blog/)

</div>


## Local development

There are build-time warnings on around the `_includes` folder not recognized by the theme, but this seems okay as that folder is used in this project even if it does not exist in the theme.

### Main site

To setup and run this repo locally, follow this instructions in this [gist](https://gist.github.com/MichaelCurrin/1085ab164550b31272699920b5549d4b). I hope you'll find that useful so you can setup your own static site for whatever you wish.

### Admin view

The Jekyll Admin plugin adds a CMS view for editing content. Any changes saved are done as local uncommitted changes in the repo.

Once the site is running as per section above, you can access the admin URL. Note that no username or password is needed.

- http://localhost:5000/admin

Note that the URL paths is fixed, even if the main site is configured to serve on a subpath.

The [forestry.io](http://forestry.io/) service is also used a convenient remote CMS.


## Notes

The [github-pages](https://github.com/github/pages-gem) gem is set in the Gemfile so that a Github Pages theme can be used and so that `site.github` can be used in templates. The site still builds to Github Pages without it set in the config. But it is added for consistency and in case it is needed for Netlify (running outside of Github).

That plugin also includes the `jekyll-sitemap` and `jekyll-feed` plugins.


## License

Licensed under [MIT](/LICENSE).

You can reuse any **code** in this project for your own project but you must include a copy of the original license.

For pages and blog posts, **copyright** on the **content** belongs to the author only - [MichaelCurrin](https://github.com/MichaelCurrin/).
