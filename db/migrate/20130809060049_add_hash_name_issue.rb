class AddHashNameIssue < ActiveRecord::Migration
  def up
    add_column :issues, :hash_name, :string
  end

  def down
    remove_column :issues, :hash_name
  end
end
