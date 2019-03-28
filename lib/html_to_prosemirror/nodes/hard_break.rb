module HtmlToProsemirror
  module Nodes
    class HardBreak < Node

      def matching
        @node.name === 'br'
      end

      def data
        {
          type: "hard_break"
        }
      end
    end
  end
end
