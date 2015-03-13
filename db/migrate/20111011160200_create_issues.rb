class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :name
      t.text :description
      t.integer :priority
      t.string :status
      t.integer :project_id
      t.integer :assignee_id
      t.date :started_on
      t.date :due_on

      t.timestamps
    end
  end
end
