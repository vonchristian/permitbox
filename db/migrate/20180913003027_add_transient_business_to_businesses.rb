class AddTransientBusinessToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :transient_business, :boolean, default: false
  end
end
