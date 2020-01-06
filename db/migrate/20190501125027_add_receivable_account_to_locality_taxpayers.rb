class AddReceivableAccountToLocalityTaxpayers < ActiveRecord::Migration[5.2]
  def change
    add_reference :locality_taxpayers, :receivable_account, foreign_key: { to_table: :accounts }, type: :uuid 
  end
end
