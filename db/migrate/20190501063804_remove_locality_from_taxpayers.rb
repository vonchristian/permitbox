class RemoveLocalityFromTaxpayers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :taxpayers, :locality, foreign_key: true
  end
end
