USERS = 60
puts "Generating #{USERS} users..."
User.delete_all
USERS.times do
  first_name, last_name = Faker::Name.first_name, Faker::Name.last_name
  User.create :name => [first_name, last_name].join(" "), :email => "#{last_name.downcase}@#{Faker::Internet.domain_name}"
end

PROJECTS = 50
puts "Generating #{PROJECTS} projects..."
Project.delete_all
PROJECTS.times do
  Project.create :name => Forgery(:name).company_name, :description => Faker::Lorem.sentence, :on_hold => rand(10) > 6
end

ISSUES = 5000
puts "Generating #{ISSUES} issues..."
Issue.delete_all
user_ids = User.all.map(&:id)
project_ids = Project.all.map(&:id)
ISSUES.times do
  started_on = rand(10).days.ago
  due_on = started_on + rand(20).days
  Issue.create(:name => "Issue #{rand(1000000)}", :description => "#{Faker::Lorem.sentence}", :priority => rand(9) + 1, :project_id => project_ids[rand(project_ids.size)], :assignee_id => user_ids[rand(user_ids.size)], :started_on => started_on, :due_on => due_on, :status => Issue::STATUSES[rand(Issue::STATUSES.size)])
end
