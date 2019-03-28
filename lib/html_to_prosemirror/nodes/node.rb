module HtmlToProsemirror
  module Nodes

    class Node
      attr_writer :wrapper
      attr_writer :type

      def type
        @type || 'node'
      end

      def initialize(dom_node)
        @node = dom_node
      end

      def matching
        false
      end

      def data
        {}
      end
    end
  end
end
