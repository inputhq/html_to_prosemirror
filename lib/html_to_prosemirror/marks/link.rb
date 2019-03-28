module HtmlToProsemirror
  module Marks
    class Link < Mark

      def matching
        @node.name === 'a'
      end

      def data
        {
          type: "link",
          attrs: {
            href: @node.attribute('href').value
          }
        }
      end
    end
  end
end
