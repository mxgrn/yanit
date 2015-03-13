module Inspectable
  extend ActiveSupport::Concern

  included do |base|
    include Netzke::Basepack::ActionColumn

    column :inspect do |c|
      c.type = :action
      c.actions = [{name: :inspect, icon: :arrow_right}]
      c.width = 20
      c.text = ""
    end

    js_configure do |c|
      c.on_inspect = <<-JS
        function(grid, rowIndex, colIndex){
          var record = grid.getStore().getAt(rowIndex);
          console.log(record.id);
          var workspace = Ext.ComponentManager.get('application__workspace');
          workspace.netzkeLoadComponentByClass("#{name.sub("Grid", "Inspector")}", {newTab: true, clientConfig: {record_id: record.get('id')}});
        }
      JS
    end
  end
end
