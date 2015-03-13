# Component that allows exploring issues per project (using 2 grids). Inherits from the same Netzke::Communitypack::OneToManyExplorer as UserIssueExplorer.
class ProjectIssueExplorer < OneToManyExplorer
  def configure(c)
    c.title = "Project/Issues"
    c.foreign_key = :project_id
    super
  end

  component :container do |c|
    c.klass = ProjectGrid
    c.region = :north
    c.height = 200
    super c
  end

  component :collection do |c|
    c.klass = IssueGrid
    c.override_columns = {
      project__name: {included: false} # we don'n need this column in ProjectIssueExplorer
    }
    super c
  end
end
