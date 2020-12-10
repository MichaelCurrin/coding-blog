---
title: Use a package manager - or not?
description: Using manual and automated flows to install/update packages like Rust and Go
tags: rust go
---

## TL;DR

Here are the languages I cover in this post:

- [Rust](https://github.com/MichaelCurrin/learn-to-code/tree/master/en/topics/scripting_languages/Rust)
- [Go](https://github.com/MichaelCurrin/learn-to-code/tree/master/en/topics/scripting_languages/Go)

You _can_ manage them directly using the approaches covered on the homepage sites (and later in this post).

But I think that is very inconvenient compared to using a package manager to install them, such as `apt-get`, `brew`, `yum` or `dnf`. And while Rust is easy to update without a package manager, the Go update flow remains tedious.

However, the main benefit of _not_ using a package manager, is that you get the latest packages sooner, if that is important to you. Though latest can also mean more risk.

I cover steps for both in this article toward the end, so you can easily compare them for yourself and run them if you like.


## Summary of manual vs package manager approaches

I've been refining my ability to install and maintain packages on Linux (Debian or Linux Lite usually) and found it is not clear sometimes which route to use.

Strangely enough, the `curl` approach is usually recommended for Linux even when there _is_ an `apt-get` option available (which is the reason for this post). Yet on the macOS site, using `brew` is recommended over `curl`.

In this post, I explain two flows, summarized here with pros and cons.

<!-- TODO use :heavy_plus_sign: :heavy_minus_sign: but currently not supported -->

- Use **package manager** like `brew` or `apt`
    - PRO This is very convenient.
    - PRO It's easy to apply across systems
        - using `brew install foo` and `apt install foo`
    - CON You won't get the latest version as the package manager can be behind.
    - PRO But... that can be a _pro_ since you'll get delayed updates but which are more **secure** as they have already been around a while before you use it
- Use a manual approach which might involve steps in the browser and command-line
    - PRO More controlled
        - Isolated from `apt-get`
    - PRO More up to date.
    - CON Inconsistent across packages
        - Each has their own way to install and update, which you have to learn
    - CON Far more tedious to remember and run
    - CON Hard to automate for installs and updates and this adds friction for the user
        - Especially when you need to open up the browser to pick and download a file


## Discussions of approaches

### Use a package manager

It is **easy** to remember just the name of a package like `rustc` or `golang` when it comes to installing with `apt-get` or `brew`.

Once the package is installed, you won't even have to remember or use the name again.

### Manage yourself

The downside is that when you install you have to have exact syntax (which can also change as the package evolves).

Furthermore, you don't get the benefit of managing updates through `apt` or your system package manager GUI. So instead of using `apt upgrade` or letting your system be configured to check for updates on schedule, you have to manage each package individually. Such as running an update command from within the tool, or sometimes even having to use curl or download a zip from the website. This can be annoying for regular updates especially of IDEs - I've had this issue wih Sublime and VS Code.

This might be okay if you prefer to manage versions more conservatively, but my preference is to have the latest versions of multiple packages without having to think about each package. And if they are non-essential dev tools (my machine will still run without them) then I am happy to have a bit of risk to upgrade to the latest automatically. Also the APT package repositories are generally well-vetted by the community (and especially risk-averse on the Debian side) so you're unlikely to get any buggy updates. And if there are any buggy versions, you'll _also_ get the benefit of the next good version installed for you.


## Manual

### How to manage directly

How to install packages the "recommended" way, without a package manager. Note that these instructions are incomplete - the docs cover how to update `PATH` so you can use the packages properly.

#### Rust

The Rust docs recommend using `curl` and `sh.

[Install Rust](https://www.rust-lang.org/tools/install)

```sh
$ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

#### Go

The Go docs recommend choosing and downloading a binary from their website. You have to choose one for your OS and a version number. There is no easy `curl` option.

Then unzip it to `/usr/local`.

[Install the Go Tools](https://golang.org/doc/install)

```sh
$ tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
```

The docs also cover how to install multiple versions of Go side by side.

### How to update directly

#### Rust

Once installed, you'll update from within this package:

```sh
$ rustup update
```

#### Go

To update Go, you delete the old one and install the new one as above. This is tedious as you have to go to the website to download a new version.

```sh
$ sudo rm -rf /usr/local/go
```

See [gist](https://gist.github.com/nikhita/432436d570b89cab172dcf2894465753).

Also, here is entire repo [udhos/update-golang](https://github.com/udhos/update-golang) that exists to make the process of update Go smoother, indicating that the current experience is far from ideal.


## How to manage using a package manager

### Install
While it is not covered on their websites, I have stumbled across these packages in my system's package manager GUI, which makes it easy to find packages to install, mark them for updates and do system-wide updates.

Here is how to install with `apt` or `apt-get`.

#### Rust

```sh
$ sudo apt-get install rustc -y
```

That should hopefully install related dependencies like `rust-src` and `rust-doc` but you can install them manually if needed. See [Rust results on the Ubuntu APT list](https://packages.ubuntu.com/search?suite=default&section=all&arch=any&keywords=rust&searchon=names).

If that failed, try installing these and then retry:

```sh
$ # Debian
$ sudo apt-get install build-essential -y
$ # Red Hat
$ sudo dnf install cmake gcc -y
```

#### Go

The `golang` package is already available in APT repositories.

```sh
$ sudo apt-get install golang
```

If you find that is behind the newest version, you can use a different repository for a more up to date version according to this [gist](https://gist.github.com/Adron/4e1e7d0f71da7c415f455d5930ea94c9).

```sh
$ sudo add-apt-repository ppa:ubuntu-lxc/lxd-stable
$ sudo apt-get update
$ sudo apt-get install golang
```

### Update

Run a global update as below to upgrade both Rust and Go.

```sh
$ sudo apt-get update
$ sudo apt-get upgrade -y
```

From [Brew FAQs](https://docs.brew.sh/FAQ)

```sh
$ brew upgrade
```
