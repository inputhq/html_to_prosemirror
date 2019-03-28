RSpec.describe HtmlToProsemirror::Nodes::Paragraph do
  it "renders simple paragraph correctly" do
    html = '<p>Example Text</p>';
    json = {
      type: 'doc',
      content: [{
        type: 'paragraph',
        content: [{
          type: 'text',
          text: 'Example Text',
        }]
      }]
    }

    renderer = HtmlToProsemirror::Renderer.new()
    expect(json).to eq renderer.render(html)
  end

  it "renders multiple paragraph correctly" do
    html = '<p>First Paragraph</p><p>Second Paragraph</p>';
    json = {
      type: 'doc',
      content: [{
        type: 'paragraph',
        content: [{
          type: 'text',
          text: 'First Paragraph',
        }]
      },{
        type: 'paragraph',
        content: [{
          type: 'text',
          text: 'Second Paragraph',
        }]
      }]
    }

    renderer = HtmlToProsemirror::Renderer.new()
    expect(json).to eq renderer.render(html)
  end

  it "renders emojis correctly 🔥" do
    html = '<p>🔥</p>';
    json = {
      type: 'doc',
      content: [{
        type: 'paragraph',
        content: [{
          type: 'text',
          text: '🔥',
        }]
      }]
    }

    renderer = HtmlToProsemirror::Renderer.new()
    expect(json).to eq renderer.render(html)
  end

  it "renders marks in paragraph correctly" do
    html = '<p>Example <strong><em>Text</em></strong>.</p>';
    json = {
      type: 'doc',
      content: [{
        type: 'paragraph',
        content: [{
          type: 'text',
          text: 'Example ',
        }, {
          type: 'text',
          text: 'Text',
          marks:[{
            type: 'bold',
          }, {
            type: 'italic',
          }]
        },{
          type: 'text',
          text: '.',
        }]
      }]
    }

    renderer = HtmlToProsemirror::Renderer.new()
    expect(json).to eq renderer.render(html)
  end
end
