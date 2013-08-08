class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.references :department
      t.string :customer_email
      t.string :customer_name
      t.string :status, default: :waiting_staff
      t.integer :assignee_id
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end
