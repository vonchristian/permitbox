class CreateCompetetiveIndexCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :competetive_index_categories, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
