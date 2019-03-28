module HtmlToProsemirror
  module Marks
    class Italic < Mark

      def matching
        @node.name === 'em'
      end

      def data
        {
          type: "italic"
        }
      end
    end
  end
end
