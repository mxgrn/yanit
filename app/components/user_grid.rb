# User grid with some pre-configured columns
class UserGrid < Netzke::Basepack::Grid
  model "User"

  def configure(c)
    c.title = 'Users'
    super
    c.model = 'User'
  end

  column :name do |c|
    c.width = 200
    c.flex = 1
  end

  column :email do |c|
    c.width = 200
  end

  column :created_at do |c|
    c.read_only = true
  end

  column :updated_at do |c|
    c.read_only = true
  end

  include Inspectable
end
