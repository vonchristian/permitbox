class AddAccessScopeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :access_scope, :integer
    add_index :users, :access_scope
  end
end
