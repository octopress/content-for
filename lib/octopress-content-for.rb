require "octopress-content-for/version"
require "octopress-tag-helpers"

module Octopress
  module Tags
    module ContentFor
      class Tag < Liquid::Block

        def initialize(tag_name, markup, tokens)
          super
          @tag_name = tag_name
          @markup   = markup
        end

        def render(context)
          return unless markup = TagHelpers::Conditional.parse(@markup, context)

          @block_name ||= TagHelpers::ContentFor.get_block_name(@tag_name, markup)
          TagHelpers::ContentFor.append_to_block(context, @block_name, super)
          ''
        end
      end
    end

    module Yield
      class Tag < Liquid::Tag

        def initialize(tag_name, markup, tokens)
          if markup.strip == ''
            raise IOError.new "Yield failed: {% #{tag_name} #{markup}%}. Please provide a block name to yield. - Syntax: {% yield block_name %}"
          end

          super
          @markup = markup
          if markup =~ TagHelpers::Var::HAS_FILTERS
            markup = $1
            @filters = $2
          end
          @block_name = TagHelpers::ContentFor.get_block_name(tag_name, markup)
        end

        def render(context)
          return unless markup = TagHelpers::Conditional.parse(@markup, context)
          content = TagHelpers::ContentFor.render(context, @block_name)

          unless content.nil? || @filters.nil?
            content = TagHelpers::Var.render_filters(content, @filters, context)
          end

          content
        end
      end
    end
  end
end

Liquid::Template.register_tag('content_for', Octopress::Tags::ContentFor::Tag)
Liquid::Template.register_tag('yield', Octopress::Tags::Yield::Tag)

if defined? Octopress::Docs
  Octopress::Docs.add({
    name:        "Octopress Content For",
    gem:         "octopress-content-for",
    version:     Octopress::Tags::ContentFor::VERSION,
    description: "Content_for and yeild tags with filters and conditional output",
    path:        File.expand_path(File.join(File.dirname(__FILE__), "../")),
    source_url:  "https://github.com/octopress/content-for"
  })
end
