# Our customized project grid
class ProjectGrid < Netzke::Basepack::Grid
  def configure(c)
    c.title = "Projects"
    super
    c.model = "Project"
  end

  # columns customizations (these are optional)
  column :name do |c|
    c.width = 200
  end

  column :description do |c|
    c.flex = 1
  end

  column :created_at do |c|
    c.read_only = true
  end

  column :updated_at do |c|
    c.read_only = true
  end

  # The inspect action (and column)
  include Inspectable
end
