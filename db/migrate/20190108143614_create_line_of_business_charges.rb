class CreateLineOfBusinessCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :line_of_business_charges, id: :uuid do |t|
      t.string :name
      t.decimal :amount
      t.belongs_to :revenue_account, foreign_key: { to_table: :accounts }, type: :uuid
      t.belongs_to :line_of_business, foreign_key: true, type: :uuid


      t.timestamps
    end
  end
end
