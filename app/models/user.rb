class User < ActiveRecord::Base
  has_many :issues, :foreign_key => "assignee_id"
  
  scope :assignees_for_project, lambda { |project| select("DISTINCT users.*").joins(:issues).where(:issues => {:project_id => project.id}) }

  # netzke_attribute :number_of_issues
  # netzke_attribute :number_of_open_issues

  def number_of_issues
    issues.count
  end

  def number_of_open_issues
    issues.open_or_new.count
  end
end
