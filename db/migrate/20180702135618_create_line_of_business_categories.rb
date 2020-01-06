class CreateLineOfBusinessCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :line_of_business_categories, id: :uuid do |t|
      t.string :title

      t.timestamps
    end
  end
end
