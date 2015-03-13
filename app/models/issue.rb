class Issue < ActiveRecord::Base
  STATUSES = %w[new open solved closed rejected]

  belongs_to :assignee, :class_name => "User"
  belongs_to :project

  scope :open_or_new, -> { where("status = 'open' OR status = 'new'") }
end
