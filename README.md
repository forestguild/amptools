# AMP Tools for Jekyll

> Fork of [juusaw/amp-jekyll](https://github.com/juusaw/amp-jekyll)

[![Gem Version](https://badge.fury.io/rb/jekyll-amptools.svg)](https://badge.fury.io/rb/jekyll-amptools)

## Usage

### "Fire and forget"

1. Create layout `amp.html` (check [AMP By Example](https://ampbyexample.com/boilerplate/)), use `{{ content }}` on it
2. On any page where you want to use amp, set `layout: wiki` (yep, i know. That will be changed to config later)

### Filters

* **amp_images** - Convert your `<img>` tags to `<amp-img>` with auto calcualting size, example: `{{ content | amp_images }}`
* **amp_iframes** - Convert your `<iframe>` tags to `<amp-iframe>` with auto "un-sandbox"ing, example: `{{ content | amp_iframes }}`

all in one: `{{ content | amp_images | amp_iframes }}`
