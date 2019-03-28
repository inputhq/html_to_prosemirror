RSpec.describe HtmlToProsemirror::Nodes::HardBreak do
  it "renders hard breaks correctly" do
    html = '<p>Hard <br />Break</p>';
    json = {
      type: 'doc',
      content: [{
        type: 'paragraph',
        content: [{
          type: 'text',
          text: 'Hard ',
        },{
          type: 'hard_break'
        },{
          type: 'text',
          text: 'Break',
        }]
      }]
    }

    renderer = HtmlToProsemirror::Renderer.new()
    expect(json).to eq renderer.render(html)
  end
end
