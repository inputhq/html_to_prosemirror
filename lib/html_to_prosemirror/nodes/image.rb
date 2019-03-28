module HtmlToProsemirror
  module Nodes
    class Image < Node

      def matching
        @node.name === 'img'
      end

      def data
        {
          type: "text",
          text: @node.attribute('src').value,
          marks: [{
            type: 'link',
            attrs: {
              href: @node.attribute('src').value
            }
          }]
        }
      end
    end
  end
end
