module HtmlToProsemirror
  module Nodes
    class CodeBlock < Node

      def matching
        @node.name === 'code' && @node.parent.name === 'pre'
      end

      def data
        block = { type: "code_block" }
        lang = get_language
        block.merge({attrs: { language: lang } }) if lang
        block
      end

      def get_language
        lang = @node.attribute('class')
        if (lang && lang.value)
          return lang.value.gsub("/^language-/", "")
        end
        return nil
      end
    end
  end
end
