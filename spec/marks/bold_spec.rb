RSpec.describe HtmlToProsemirror::Marks::Bold do
  it "renders strong correctly" do
    html = '<p><strong>Example Text</strong></p>';
    json = {
      type: 'doc',
      content: [{
        type: 'paragraph',
        content: [{
          type: 'text',
          text: 'Example Text',
          marks: [{
            type: 'bold',
          }]
        }]
      }]
    }

    renderer = HtmlToProsemirror::Renderer.new()
    expect(json).to eq renderer.render(html)
  end
end
