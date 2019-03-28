module HtmlToProsemirror
  module Marks
    class Code < Mark

      def matching
        if (@node.parent.name === 'pre')
          return false
        end
        @node.name === 'code'
      end

      def data
        {
          type: "code"
        }
      end
    end
  end
end
