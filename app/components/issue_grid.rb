# This issue grid is used across multiple views
class IssueGrid < Netzke::Basepack::Grid
  js_configure do |c|
    c.title = "Issues"
  end

  def configure(c)
    super
    c.model = "Issue"
  end

  # columns customizations (these are optional)
  column :description do |c|
    c.flex = 1
  end

  column :status do |c|
    c.editor = {xtype: :combobox, store: Issue::STATUSES}
    c.width = 60
  end

  column :priority do |c|
    c.width = 50
  end

  column :created_at do |c|
    c.hidden = true
  end

  column :updated_at do |c|
    c.hidden = true
  end

  column :inspect do |c|
    c.width = 20
  end

  # The inspect action (and column)
  include Inspectable

  def preconfigure_record_window(c)
    super
    c.form_config.klass = IssueForm
    c.width = 600
  end
end
