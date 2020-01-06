class RemoveReceivableAccountFromBusinessTaxCategories < ActiveRecord::Migration[5.2]
  def change
    remove_reference :business_tax_categories, :receivable_account, foreign_key: { to_table: :accounts }, type: :uuid
  end
end
