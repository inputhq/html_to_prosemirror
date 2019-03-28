module HtmlToProsemirror
  module Nodes
    class Heading < Node

      def matching
        !get_level.nil?
      end

      def data
        {
          type: "heading",
          attrs: {
            level: get_level
          }
        }
      end

      def get_level
        matches = @node.name.scan(/^h([1-6])$/).first
        if matches
          return matches.first
        end
        return nil
      end
    end
  end
end
