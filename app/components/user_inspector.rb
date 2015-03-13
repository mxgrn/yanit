# A component used to inspect a spicific User. Has the user form on the top (using the UserForm component), and the IssueGrid on the bottom, which will display the issues assigned to the given user.
class UserInspector < Netzke::Base
  attr_accessor :user

  def configure(c)
    super

    c.record_id ||= User.first.id # handy for testing

    self.user = User.find(c.record_id)

    c.title = user.name

    c.items = [ :user_form, :user_issues ]
  end

  component :user_form do |c|
    c.record_id = config.record_id
    c.region = :north
    c.height = 85
    c.border = false
    c.klass = UserForm
    c.read_only = true
  end

  component :user_issues do |c|
    c.region = :center
    c.title = "Issues assigned to #{user.name}"
    c.border = false
    c.klass = IssueGrid

    # we don't need the assignee__name column in this view
    c.override_columns = {
      assignee__name: {included: false}
    }

    # Make IssueGrid to only work with the issues for the inspected user
    c.strong_default_attrs = {assignee_id: config.record_id}
    c.scope = {assignee_id: config.record_id}
  end
end
