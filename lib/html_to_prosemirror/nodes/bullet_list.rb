module HtmlToProsemirror
  module Nodes
    class BulletList < Node

      def matching
        @node.name === 'ul'
      end

      def data
        {
          type: "bullet_list"
        }
      end
    end
  end
end
