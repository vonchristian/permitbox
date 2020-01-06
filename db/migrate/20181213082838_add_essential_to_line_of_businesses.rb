class AddEssentialToLineOfBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_column :line_of_businesses, :essential, :boolean, default: :false
  end
end
