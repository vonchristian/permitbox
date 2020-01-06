class AddSexToTaxpayers < ActiveRecord::Migration[5.2]
  def change
    add_column :taxpayers, :sex, :integer
    add_index :taxpayers, :sex
  end
end
