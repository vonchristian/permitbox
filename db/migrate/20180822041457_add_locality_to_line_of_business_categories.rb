class AddLocalityToLineOfBusinessCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :line_of_business_categories, :locality, foreign_key: true, type: :uuid
  end
end
