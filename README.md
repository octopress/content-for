# Octopress Content For

Add content_for and yield tags to Jekyll with conditional rendering and in-line filters.

[![Build Status](https://travis-ci.org/octopress/content-for.svg)](https://travis-ci.org/octopress/content-for)
[![Gem Version](http://img.shields.io/gem/v/octopress-content-for.svg)](https://rubygems.org/gems/octopress-content-for)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://octopress.mit-license.org)

## Installation

If you're using bundler add this gem to your site's Gemfile in the `:jekyll_plugins` group:

    group :jekyll_plugins do
      gem 'octopress-content-for'
    end

Then install the gem with Bundler

    $ bundle

To install manually without bundler:

    $ gem install octopress-content-for

Then add the gem to your Jekyll configuration.

    gems:
      -octopress-content-for

## Usage

Use it like a typical `content_for` tag.

```
{% content_for awesome_content %}
some content
{% endcontent_for %}

{% yield awesome_content %}  //=> some content
```

Use in-line filters.

```
{% yield awesome_content | upcase %}  //=> SOME CONTENT
```

Use conditional rendering in both `content_for` and `yield` tags.

```
{% content_for footer unless page.footer == false %}
Footer!
{% endcontent_for %}

{% yield footer if page.footer %}
```

## Contributing

1. Fork it ( https://github.com/octopress/content-for/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
