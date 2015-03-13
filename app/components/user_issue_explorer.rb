# Component that allows exploring issues per user (using 2 grids). Inherits from the same Netzke::Communitypack::OneToManyExplorer as ProjectIssueExplorer.
class UserIssueExplorer < OneToManyExplorer
  def configure(c)
    c.title = "Users/Issues"
    c.foreign_key = :assignee_id
    super
  end

  component :container do |c|
    c.klass = UserGrid
    c.region = :west
    c.width = 300
    c.split = true
    super c
  end

  component :collection do |c|
    c.klass = IssueGrid
    c.override_columns = {
      assignee__name: {included: false} # we don'n need this column in ProjectIssueExplorer
    }
    super c
  end

  # Override the endpoint in order to additionally set the title of the collection grid
  endpoint :select_container_record do |params, this|
    super(params, this)
    this.collection.set_title("Issues assigned to #{User.find(component_session[:container_id]).name}");
  end
end
