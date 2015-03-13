{
  rootVisible: false,

  initComponent: function() {
    this.callParent();

    this.on('render', function() {
      this.workspace = Ext.ComponentManager.get(this.workspaceId);
    }, this);

    this.on('itemclick', function(view, r, item, index, e) {
      var component = r.raw.cmp;
      if (component) this.workspace.netzkeLoadComponentByClass(component, {newTab: e.hasModifier()});
    });
  }
}
