# Our custom IssueForm - it has a custom layout and pre-assigned model
class IssueForm < Netzke::Basepack::Form
  def configure(c)
    c.model = 'Issue'
    c.record_id = Issue.first.try(:id) # default record
    super
    c.items = [
      :name,
      {
        layout: :hbox, border: false, defaults: {border: false}, items: [{
          flex: 1,
          layout: :anchor,
          defaults: {anchor: "-8"},
          items: [:project__name, :priority, :assignee__name]
        },{
          flex: 1,
          layout: :anchor,
          defaults: {anchor: "100%"},
          items: [{name: :status, xtype: :combobox, store: Issue::STATUSES}, :started_on, :due_on]
        }]
      },
      {name: :description, hide_label: true}
    ]
  end
end
