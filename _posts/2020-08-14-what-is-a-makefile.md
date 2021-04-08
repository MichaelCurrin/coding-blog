---
title: What is a Makefile?
tags: make
---

## Intro

A Makefile comes from a C progamming origin for compile C files in to binaries. You’ll still see it in modern C programs. If you ever used a Rakefile or NPM scripts, its a lot like that.

You need the `make` command installed. This comes by default when I use Linux and Mac systems.

In a project root you need a `Makefile` to exist. For Windows, this will be `make.bat` and has different syntax.

Run `make` and a `TARGET` (a command defined in Makefile).


## Make and Jekyll

See my [jekyll-blog-demo](https://github.com/MichaelCurrin/jekyll-blog-demo) repo - a simple Jekyll blog quickstart.

This is what the [Makefile](https://github.com/MichaelCurrin/jekyll-blog-demo/blob/master/Makefile) looks like there:

- `Makefile`
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

You can also just run `make` and not arguments that will run the default target, which in this case is `install`. This is a C programming convention. Note that if you don't set a default, then the target would be used. So I removed the `default: ` line then `make` would run `make help`.

You can create a command with any "target" definition and multiple steps (see my `install` command).

I like to also set build commands.

```sh
$ make build-prod
```

That would map to this:

```
JEKYLL_ENVIRONMENT=prod bundle exec jekyll build --trace
```

## Make and Python

You can also chain them together such that make fix effectively runs make format and then `make lint`. In this case, `lint` also calls linting targets defined higher up.

[PyProject Template - Makefile](https://github.com/MichaelCurrin/py-project-template/blob/master/Makefile#L37)

You can mostly think of it as a way of running shell commands with custom easy targets in a `Makefile `that is added to version control.


## Make and CI

My Netlify build command then uses `make build` and my CI flow for GitHub actions also uses `make` commands.

[PyProject Template - main.yml](https://github.com/MichaelCurrin/py-project-template/blob/master/.github/workflows/main.yml#L18)


## Resources

I saved this section until the end, so you can focus on seeing `make` and `Makefile` in action in a Jekyll or Python project, before getting into the finer details.

- [Makefile](https://en.wikipedia.org/wiki/Makefile) on Wikipedia
	> A makefile is a file containing a set of directives used by a make build automation tool to generate a target/goal.

Here is an overview of the syntax:

```
target … : prerequisites …
        recipe
        …
        …
```

Generally the target is not indented and steps inside a command are indented. Note that it uses tabs and not spaces.

That example comes from the GNU [make](https://www.gnu.org/software/make/manual/make.html#Overview) docs. It is probably to heavy and detailed for beginners, but it is there in case you any official documentation.

This arcticle is more beginner-friendly. It also goes into some specific examples around using `make` for a C project.

- [What is a Makefile and how does it work?](https://opensource.com/article/18/8/what-how-makefile) on OpenSource.com


## Advanced

There are some gotchas for advanced scripting for vars and conditionals, like `$VARIABLE` needs to be `$$VARIABLE`. But for basic uses you can do plenty without getting into that.

I wrote a [Make cheatsheet](https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/make/) for some of the more advanced syntax.
