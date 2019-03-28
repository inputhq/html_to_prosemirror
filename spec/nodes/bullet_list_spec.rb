RSpec.describe HtmlToProsemirror::Nodes::BulletList do
  it "renders bullet list correctly" do
    html = '<ul><li><p>First Example</p></li><li><p>Second Example</p></li></ul>';
    json = {
      type: 'doc',
      content: [{
        type: 'bullet_list',
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
