require "html_to_prosemirror/version"
require "html_to_prosemirror/marks/mark"
require "html_to_prosemirror/marks/bold"
require "html_to_prosemirror/marks/code"
require "html_to_prosemirror/marks/italic"
require "html_to_prosemirror/marks/link"
require "html_to_prosemirror/nodes/node"
require "html_to_prosemirror/nodes/bullet_list"
require "html_to_prosemirror/nodes/code_block_wrapper"
require "html_to_prosemirror/nodes/code_block"
require "html_to_prosemirror/nodes/hard_break"
require "html_to_prosemirror/nodes/heading"
require "html_to_prosemirror/nodes/image"
require "html_to_prosemirror/nodes/list_item"
require "html_to_prosemirror/nodes/ordered_list"
require "html_to_prosemirror/nodes/paragraph"
require "html_to_prosemirror/nodes/text"
require "html_to_prosemirror/nodes/user"
require 'nokogiri'

module HtmlToProsemirror
  class Error < StandardError; end
  # Your code goes here...
  class Renderer
    def initialize()
      @storedMarks = []
      @marks = [
        HtmlToProsemirror::Marks::Bold,
        HtmlToProsemirror::Marks::Code,
        HtmlToProsemirror::Marks::Italic,
        HtmlToProsemirror::Marks::Link
      ]
      @nodes = [
        HtmlToProsemirror::Nodes::BulletList,
        HtmlToProsemirror::Nodes::CodeBlockWrapper,
        HtmlToProsemirror::Nodes::CodeBlock,
        HtmlToProsemirror::Nodes::HardBreak,
        HtmlToProsemirror::Nodes::Heading,
        HtmlToProsemirror::Nodes::Image,
        HtmlToProsemirror::Nodes::ListItem,
        HtmlToProsemirror::Nodes::OrderedList,
        HtmlToProsemirror::Nodes::Paragraph,
        HtmlToProsemirror::Nodes::Text,
        HtmlToProsemirror::Nodes::User
      ]
    end

    def render(value)
      minified = minify_html(value.strip! || value)
      puts minified
      @document = Nokogiri::HTML.fragment(minified)
      content = render_children(@document)
      return {
        type: 'doc',
        content: content,
      }
    end
  private

    # def get_document_body
    #   return @document.search('body')[0];
    # end

    def render_children(node)
      nodes = []
      node.children.each do |child|
        child_node = get_matching_node(child)
        if( child_node)
          item = child_node.data()
          if (item === nil)
            if (child.children.length > 0)
              nodes = nodes + render_children(child)
            end
            next
          end
          if (child.children.length > 0)
            item = item.merge({
              content: render_children(child),
            })
          end
          if (@storedMarks.count > 0)
              item = item.merge({
                marks: @storedMarks,
              })
              @storedMarks = [];
          end
          # if (child_node.wrapper)
          #   item['content'] = [
          #     instance.wrapper.merge({
          #       content: item['content'],
          #     }),
          #   ]
          # end
          nodes.push(item)
        end

        child_mark = get_matching_mark(child)
        if (child_mark)
          @storedMarks.push(child_mark.data())
          if (child.children.length > 0)
            nodes = nodes + render_children(child)
          end
        end
      end
      return nodes;
    end
    # Find which Node matches the Html Node
    def get_matching_node(item)
      return get_matching_class(item, @nodes)
    end
    # Find which Mark matches the HtmlElement
    def get_matching_mark(item)
      return get_matching_class(item, @marks)
    end
    # Find which class matches the HtmlElement
    def get_matching_class(node, classes)
      found = classes.select do |clazz|
        instance = clazz.new(node)
        if (instance.matching())
          return instance
        end
      end
      found.first
    end

    def minify_html(html)
      # 1. Remove all comments: gsub(/(<!--(\w|\s|:|!|#|<|>|'|"|=|;|,|\.|\?)*-->|\/\*[^\*]*\*\/|^(\t|\s)*\/\/.*)/, '')
      # 1.1 html comments without special characters: <!--(\w|\s|:|!|#|<|>|'|"|=|;|,|\.|\?)*-->
      # 1.2. Remove javascript comments e.g. /* */ and // \/\*[^\*]*\*\/ and ^(\t|\s)*\/\/.*
      # 3. Replace all carrier return and all tabs by a single space gsub(/(\n|\t)/, ' ').
      # 4. Replace any consecutive spaces by a single space gsub(/\s{2,}/, ' ')
      # 5. Remove space between tags gsub(/>\s+</, '><').strip.
      html.gsub(/(<!--(\w|\s|:|!|#|<|>|'|"|=|;|,|\.|\?)*-->|\/\*[^\*]*\*\/|^(\t|\s)*\/\/.*)/, '').
        gsub(/(\n|\t)/, ' ').
        gsub(/\s{2,}/, ' ').
        gsub(/>\s+</, '><').strip
    end
  end
end
