class AddPermitTypeToPermits < ActiveRecord::Migration[5.2]
  def change
    add_column :permits, :permit_type, :integer
    add_index :permits, :permit_type
  end
end
