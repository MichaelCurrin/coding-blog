---
title: This blog moves to Forestry
description: ''

---
I am pleased to announce that I have moved this Jekyll blog to be managed using the [Forestry.io](https://forestry.io) CMS platform.

Some things I discovered while exploring the service:

* Configuration
  * Configuration is managed in a [_.forestry_](https://github.com/MichaelCurrin/coding-blog/tree/master/.forestry) directory in Github. Including site settings and front matter templates. This means that 
    * Configuration is version-controlled, so you can view the history for rolling back changes.
    * You can remove and import a site without having to set it up manually again.
    * An existing config file can be used as a base when creating config files for other repos and this can even be done _before_ they are imported into Forestry.
* Limits (see [pricing](https://forestry.io/pricing/ "pricing") page)
  * On the free tier you can invite up to 3 users to a Forestry site.
  * Also on the free tier, you can only manage 3 sites with Forestry.
* Managing content
  * The default sidebar view is just for editing Pages and Posts, but you can manually add more files and directories.
    * Such as the __includes_ or __layouts_ directories (you'll need to change the configuration to pickup _.html_ files rather than the default _.md_). Directories like won't matter to non-technical users, but it means a developer can edit them without leaving Forestry.
    * Add your __config.yml_ file to manage site config from in Forestry.
  * On the _Front matter_ section of the menu, you can create templates based on existing files. For example you might create a Blog post template and a Page template. When you create a new page or blog post, you can choose which template you want. A template is great for adding frontmatter fields like title or description and setting validation on the length of a field or whether it is required or not.