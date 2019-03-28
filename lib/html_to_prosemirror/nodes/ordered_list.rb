module HtmlToProsemirror
  module Nodes
    class OrderedList < Node

      def matching
        @node.name === 'ol'
      end

      def data
        {
          type: "ordered_list",
          attrs: {
            order: 1
          }
        }
      end
    end
  end
end
