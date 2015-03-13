# This component drows a tree that represents a menu. Clicking on a tree node makes a specific component to open in the Workspace component, the id to which must be passed as the :workspace_id parameter (see the Application component).
class Navigator < Netzke::Base
  js_configure do |c|
    c.extend = "Ext.tree.Panel"

    # Mix in the javascript object on class level from navigator/javascripts/navigator.js
    c.mixin
  end

  def leaf(text, component, icon = nil)
    { text: text,
      icon: icon && uri_to_icon(icon),
      cmp: component,
      leaf: true
    }
  end

  def configure(c)
    c.store = {
      root: {
        expanded: true,
        children: [
          leaf('Projects', 'ProjectGrid', :page_white_stack),
          { text: 'Issues',
            icon_cls: 'icon-issues',
            expanded: true,
            children: [
              leaf('All', 'IssueGrid', :application_view_list),
              leaf('Per project', 'ProjectIssueExplorer', :page_white_copy),
              leaf('Per user', 'UserIssueExplorer', :report_user)
            ]
          }
        ]
      }
    }

    super
  end
end
