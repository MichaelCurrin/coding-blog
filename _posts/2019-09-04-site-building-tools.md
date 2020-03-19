---
title: Site building tools
---

Lists of tools for building websites, including static websites and docs sites.

<!-- This data could be refactored to exist in YAML data file or CSV and then call an includes file to build it up. 
     A similar approach could work elsewhere on the site too. -->


## Resources

- [StaticGen.com](https://www.staticgen.com/) - list of static site generators.
- JAMStack - JavaScript, API and Mark-up.
     - [jamstack.org](https://jamstack.org)
          - [Homepage for ](https://jamstack.org/)
          - [Examples](https://jamstack.org/examples/)
          - [Resources](https://jamstack.org/resources/)
          - [Best Practices](https://jamstack.org/best-practices/)
     - [JamStack.wtf](https://jamstack.wtf/)
     - [JAMStack templates](https://templates.netlify.com/) on Netlify.
     
## Static site generators

### Hugo

- [Official site](https://gohugo.io/)
- Go

### Jekyll

- [Official site](https://jekyllrb.com/)
- Ruby

See also my resources for Jekyll - [link](https://github.com/MichaelCurrin/static-sites-generator-resources/tree/master/Jekyll).

### Gatsby

- [Official site](https://www.gatsbyjs.org/)
- JavaScript
- [Gatsby First steps](https://alligator.io/gatsbyjs/gatsby-first-steps/) tutorial

### Hydrogen

- [Official site](https://hydrogenjs.org/)
- [Github repo](https://github.com/ShailenNaidoo/hydrogen)
- JavaScript

### Next

- [Official site](https://nextjs.org/)
- JavaScript - React

### Nuxt

- [Official site](https://nuxtjs.org/)
- JavaScript - VueJS
- Github - [https://github.com/nuxt]
- Tutorials
     - [Netlify deployment](https://nuxtjs.org/faq/netlify-deployment/) guide
     - Tutorial - [Create a static site in 15 minutes or less using Vue/Nuxt and Netlify](https://codeburst.io/create-a-static-site-in-15-minutes-or-less-using-vue-js-e4e2a9945ee6)

### Hexo

- [Official site](https://hexo.io/)
- JavaScript


## Documentation site builders

### VuePress

- [Official site](https://vuepress.vuejs.org/)
- SPA (Single Page Application). Therefore movement between pages is seamless. But this is still a static site - "During the build, we create a server-rendered version of the app and render the corresponding HTML by virtually visiting each route". That was inspired by _Nuxt_ and _Gatsby_ which do something similar.
- Built on _VueJS_.
- Ideal for documentation sites.
    - It has a "default theme optimized for writing technical documentation".
    - This works well for docs of existing Vue sites.
    - Format with markdown.
    - Great for mixing in dynamic content with the statically-rendered content.
- [Vuepress examples](https://vuepress-examples.netlify.com/)
- [Vuepress introduction](https://alligator.io/vuejs/vuepress-introduction/)

### Docsify

- [Official site](https://docsify.js.org/)
- SPA (Single Page Application) - uses a single HTML file (`index.html`) and uses markdown files to add content to virtual paths.
- Built on _VueJS_.
- Format with markdown.
- Turn your existing *docs* folder into a docs site. I wrote a tutorial for this [here](https://michaelcurrin.github.io/docsify-template/#/).

### Docute

- [Official site](https://docute.org/)
- > "Docute is basically a JavaScript file that fetches Markdown files and renders them as a single-page application".

### Read The Docs

- [Official siteink](https://readthedocs.org/)
- Built on Sphinx (a Python library).
- Format with *reStructuredText* or *Markdown*.
- Host on the Read the Docs site. This seems a like a common place for libraries to host their documentation, especially if they are Python libraries. Or self-host e.g. on Github Pages.
- Build from `/docs` directory.
- > "Read the Docs simplifies software documentation by automating building, versioning, and hosting of your docs for you."

### GitBook

- [Official site](https://www.gitbook.com/)
- Format with markdown.
- Great if you don't want to write any code, but limited on number of public and private sites on the free plan.
- Can sync to Github repo.
