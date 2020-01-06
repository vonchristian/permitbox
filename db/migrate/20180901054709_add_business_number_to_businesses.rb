class AddBusinessNumberToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :business_number, :integer
  end
end
