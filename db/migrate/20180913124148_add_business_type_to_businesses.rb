class AddBusinessTypeToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :business_type, :integer
    add_index :businesses, :business_type
  end
end
