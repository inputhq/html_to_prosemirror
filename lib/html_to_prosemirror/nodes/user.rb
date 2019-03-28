module HtmlToProsemirror
  module Nodes
    class User < Node

      def matching
        @node.name === 'user-mention'
      end

      def data
        {
          type: "user",
          attrs: {
            id: @node.attribute('data-id')
          }
        }
      end
    end
  end
end
