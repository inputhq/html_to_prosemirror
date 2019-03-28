module HtmlToProsemirror
  module Marks
    class Mark
      attr_writer :type

      def type
        @type || 'mark'
      end

      def initialize(dom_node)
        @node = dom_node
      end

      def matching
        false
      end

      def data
        []
      end
    end
  end
end
