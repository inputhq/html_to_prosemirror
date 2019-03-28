module HtmlToProsemirror
  module Nodes
    class Text < Node

      def matching
        @node.name === 'text'
      end

      def data
        @text = @node.content
        {
          type: "text",
          text: @text
        }
      end
    end
  end
end
