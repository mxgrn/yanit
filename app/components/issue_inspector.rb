# Component used to inspect a given Issue. It contains a form on the top, and the assignee details on the bottom.
class IssueInspector < Netzke::Base
  attr_reader :issue

  def configure(c)
    super
    c.record_id ||= Issue.first.id # default record id, handy for debugging

    @issue = Issue.find(c.record_id)

    # Dynamically setting the title
    c.title = issue.name

    c.items = [:assignee_details, :issue_form]
  end

  component :assignee_details do |c|
    c.klass = UserForm
    c.region = :center
    c.title = "Assignee details"
    c.record_id = issue.assignee.id
    c.read_only = true
  end

  component :issue_form do |c|
    c.region = :north
    c.height = 210
    c.header = false
    c.class_name = "IssueForm"
    c.model = "Issue"
    c.record_id = config.record_id
    c.read_only = true
  end
end
