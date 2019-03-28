module HtmlToProsemirror
  module Marks
    class Bold < Mark

      def matching
        @node.name === 'strong'
      end

      def data
        {
          type: "bold"
        }
      end
    end
  end
end
