class CreateLineOfBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :line_of_businesses, id: :uuid do |t|
      t.string :name
      t.belongs_to :line_of_business_category, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
