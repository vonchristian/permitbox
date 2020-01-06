class AddReceivableAccountToBusinessTaxCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :business_tax_categories, :receivable_account, foreign_key: { to_table: :accounts }, type: :uuid
  end
end
