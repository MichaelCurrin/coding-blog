---
title: What is a Makefile?
---

A Makefile comes from a C progamming origin for compile C files in to binaries. You’ll still see it in modern C programs. If you ever used a Rakefile or NPM scripts, its a lot like that.

You need the `make` command installed. This comes by default on my Linux installs and work Mac.

Then in the project root where Makefile exists, run `make` and a `TARGET` (a command defined in Makefile).

See my [jekyll-blog-demo](https://github.com/MichaelCurrin/jekyll-blog-demo) repo - a simple Jekyll blog quickstart.

This is what the [Makefile](https://github.com/MichaelCurrin/jekyll-blog-demo/blob/master/Makefile) looks like:

```make
default: install

help:
	@egrep '^\S|^$$' Makefile

install:
	bundle config set --local path vendor/bundle
	bundle install

upgrade:
	bundle update

s serve:
	bundle exec jekyll serve --trace --livereload
```

And this is how to use it in the shell:

```sh
$ cd jekyll-blog-demo

$ make help

$ make install

$ make serve
$ # Same as above as I set `s` and `serve` to be equivalent
$ make s
```

You can also run just `make` and not arguments that will run the default target, which in this case is `install`. This is a C programming convention. Note that if you don't set a default, then the target would be used. So I removed the `default: ` line then `make` would run `make help`.


You can create a command with any "target" defintion and a multiple steps (see my `install` command). 

I like to also set build commands.

```sh
$ make build-prod
```

That would map to this:

```
JEKYLL_ENVIRONMENT=prod bundle exec jekyll build --trace
```

You can also chain then together such that make fix effectively runs make format and then make lint. In this case, lint also calls pylint and flint targets defined higher up.

[PyProject Template - Makefile](https://github.com/MichaelCurrin/py-project-template/blob/master/Makefile#L37)


You can mostly think of it as a way of running shell commands with custom easy targets in a `Makefile `that is added to version control.

My Netlify build command then uses `make build` and my CI flow for GitHub actions also uses `make` commands.

[PyProject Template - main.yml](https://github.com/MichaelCurrin/py-project-template/blob/master/.github/workflows/main.yml#L18)

There are some gotchas for advanced scripting for vars and conditionals, like `$VARIABLE` needs to be `$$VARIABLE`. But for basic uses you can do plenty without getting into that.
