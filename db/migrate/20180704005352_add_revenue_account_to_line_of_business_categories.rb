class AddRevenueAccountToLineOfBusinessCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :line_of_business_categories, :revenue_account, foreign_key: { to_table: :accounts }, type: :uuid
  end
end
