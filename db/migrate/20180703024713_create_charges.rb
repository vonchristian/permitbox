class CreateCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :charges, id: :uuid do |t|
      t.string :name
      t.belongs_to :liability_account, foreign_key: { to_table: :accounts }, type: :uuid

      t.timestamps
    end
  end
end
