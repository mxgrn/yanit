class Project < ActiveRecord::Base
  has_many :issues, :dependent => :delete_all
  has_many :assignees, :through => :issues
end
