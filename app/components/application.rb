# Our top-level Application component
class Application < Netzke::Basepack::Viewport
  include Netzke::Basepack::ItemPersistence

  HEADER_HTML = "<b>YANIT</b> - Yet Another (Netzke) Issue Tracker (a demo app)</a> | Built with <a href='http://netzke.org'>Netzke</a> v0.12.0, Rails 4.2, Ext JS 5.1 | <a href='http://github.com/mxgrn/yanit'>Code</a> | By <a href='http://twitter.com/mxgrn'>@mxgrn</a>"

  js_configure do |c|
    c.layout = :border
    c.padding = 5
  end

  def configure(c)
    c.items = [
      # Top header
      {
        region: :north,
        height: 22,
        border: 0,
        body_style: 'background: transparent; text-align: left;',
        html: HEADER_HTML
      },
      :navigator,
      :workspace
    ]
    super
  end

  #
  # Component declarations
  #

  component :navigator do |c|
    c.klass = Navigator
    c.title = "Navigator"
    c.collapsible = true
    c.split = true
    c.width = 200
    c.region = :west
    c.workspace_id = [js_id, "workspace"].join("__")
  end

  component :workspace do |c|
    c.region = :center
  end
end
