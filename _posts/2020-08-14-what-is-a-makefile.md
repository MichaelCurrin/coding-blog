---
title: What is a Makefile?
---

A Makefile comes from a C progamming origin for compile C files in to binaries. You’ll still see it in modern C programs. If you ever used a Rakefile or NPM scripts, its a lot like that.

You need the `make` command installed. This comes by default on my Linux installs and work Mac.

Then in the project root where Makefile exists, run `make` and a `TARGET` (a command defined in Makefile).

e.g. for the file I sent my [jekyll-blog-demo](https://github.com/MichaelCurrin/jekyll-blog-demo) repo:

```sh
$ cd jekyll-blog-demo

$ make help

$ make install

$ make serve
$ # Same as above as I set `s` and `serve` to be equivalent
$ make s
```

You can create any commands. Like to also set build commands.

```sh
$ make build-prod
```

Maps to something like this:


```
JEKYLL_ENVIRONMENT=prod bundle exec jekyll build --trace
```

You can also chain then together such that make fix effectively runs make format and then make lint. In this case, lint also calls pylint and flint targets defined higher up.

[PyProject Template - Makefile](https://github.com/MichaelCurrin/py-project-template/blob/master/Makefile#L37)


You can mostly think of it as a way of running shell commands with custom easy targets in a `Makefile `that is added to version control.

My Netlify build command then uses `make build` and my CI flow for GitHub actions also uses `make` commands.

[PyProject Template - main.yml](https://github.com/MichaelCurrin/py-project-template/blob/master/.github/workflows/main.yml#L18)


There are some gotchas for advanced scripting for vars and conditionals, like `$VARIABLE` needs to be `$$VARIABLE`. But for basic uses you can do plenty without getting into that.
