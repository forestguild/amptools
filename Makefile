build:
	rm -f ./*.gem
	gem build jekyll-amptools.gemspec

push:
	gem push ./*.gem
