# A rather complex component that allows working with a given project.
# Consists of a simple statistics HTML on top. Followed with UserIssueExplorer in the middle, that displays all all issues of this project per user. And finally - an issue grid with all issues for this project on the top.
class ProjectInspector < Netzke::Base
  include Netzke::Basepack::ItemPersistence

  js_configure do |c|
    c.layout = :border
  end

  attr_accessor :project

  def configure(c)
    c.record_id = Project.first.try(:id) # handy for testing

    super

    self.project = Project.find(c.record_id)

    # Set title to the current project's name
    c.title = project.name

    # Specify regions
    c.items = [
      # In the "east" we'll have a little HTML window with statistics
      {
        region: :east,
        width: 100,
        title: "Stats",
        body_padding: 5,
        html: info_html(project)
      },

      :user_issue_explorer,
      :project_issues
    ]
  end

  component :user_issue_explorer do |c|
    c.region = :center
    c.border = false

    # Container and collection customization
    c.container_config = {
      title: "People involved in #{project.name}",

      # FIXME
      # scope: lambda { |rel| rel.assignees_for_project(project) },

      columns: [{name: :name, flex: 1}, {name: :email, flex: 1}],
      bbar: []
    }

    c.collection_config = {
      scope: {project_id: project.id},
      strong_default_attrs: {project_id: project.id},

      # we only need the following columns
      columns: [:name, {name: :description, flex: 1}, :priority, :status, :started_on, :due_on],
      bbar: [:add_in_form, :edit_in_form, :apply, "-", :del]
    }
  end

  component :project_issues do |c|
    c.region = :south
    c.height = 300
    c.split = true
    c.title = "All issues for #{project.name}"
    c.klass = IssueGrid
    c.scope = {project_id: project.id}
    c.strong_default_attrs = {project_id: project.id}
    c.columns = [:name, :description, :priority, :status, :assignee__name, :started_on, :due_on]
  end

  # Simple HTML with statistics on this project
  def info_html(project)
    %Q{
      <b>Issues:</b> #{project.issues.count} total, #{project.issues.open_or_new.count} open
      <br>
      <br>
      <b>Assignees:</b> #{project.assignees.count}
    }
  end
end
