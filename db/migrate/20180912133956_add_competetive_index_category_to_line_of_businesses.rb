class AddCompetetiveIndexCategoryToLineOfBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_reference :line_of_businesses, :competetive_index_category, foreign_key: true, type: :uuid
  end
end
