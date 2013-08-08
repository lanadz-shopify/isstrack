class CreateHistoryItems < ActiveRecord::Migration
  def change
    create_table :history_items do |t|
      t.references :issue
      t.string :status, default: :waiting_staff
      t.integer :assignee_id
      t.string :subject
      t.text :body
      t.timestamps
    end
  end
end
