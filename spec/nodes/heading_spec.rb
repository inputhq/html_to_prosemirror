RSpec.describe HtmlToProsemirror::Nodes::Heading do
  it "renders h1 correctly" do
    html = '<h1>Example Text</h1>';
    json = {
      type: 'doc',
      content: [{
        type: 'heading',
        attrs: {
          level: '1'
        },
        content: [{
          type: 'text',
          text: 'Example Text',
        }]
      }]
    }

    renderer = HtmlToProsemirror::Renderer.new()
    expect(json).to eq renderer.render(html)
  end

  it "renders h2 correctly" do
    html = '<h2>Example Text</h2>';
    json = {
      type: 'doc',
      content: [{
        type: 'heading',
        attrs: {
          level: '2'
        },
        content: [{
          type: 'text',
          text: 'Example Text',
        }]
      }]
    }

    renderer = HtmlToProsemirror::Renderer.new()
    expect(json).to eq renderer.render(html)
  end

  it "renders h3 correctly" do
    html = '<h3>Example Text</h3>';
    json = {
      type: 'doc',
      content: [{
        type: 'heading',
        attrs: {
          level: '3'
        },
        content: [{
          type: 'text',
          text: 'Example Text',
        }]
      }]
    }

    renderer = HtmlToProsemirror::Renderer.new()
    expect(json).to eq renderer.render(html)
  end
end
