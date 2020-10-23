default: install

h help:
	@egrep '^\S|^$$' Makefile


install:
	bundle config set --local path vendor/bundle
	bundle install


s serve:
	bundle exec jekyll serve --trace --livereload

r serve-root:
	bundle exec jekyll serve --trace --baseurl '' --livereload


build-dev:
	bundle exec jekyll build --trace

build-prod:
	JEKYLL_ENV=production bundle exec jekyll build --trace
