RSpec.describe HtmlToProsemirror::Nodes::OrderedList do
  it "renders ordered list correctly" do
    html = '<ol><li><p>First Example</p></li><li><p>Second Example</p></li></ol>';
    json = {
      type: 'doc',
      content: [{
        type: 'ordered_list',
        attrs: {
          order: 1,
        },
        content: [{
          type: 'list_item',
          content: [{
            type: 'paragraph',
            content: [{
              type: 'text',
              text: 'First Example',
            }]
          }]
        },{
          type: 'list_item',
          content: [{
            type: 'paragraph',
            content: [{
              type: 'text',
              text: 'Second Example',
            }]
          }]
        }]
      }]
    }

    renderer = HtmlToProsemirror::Renderer.new()
    expect(json).to eq renderer.render(html)
  end
end
