module HtmlToProsemirror
  module Nodes
    class Paragraph < Node

      def matching
        @node.name === 'p'
      end

      def data
        {
          type: "paragraph"
        }
      end
    end
  end
end
