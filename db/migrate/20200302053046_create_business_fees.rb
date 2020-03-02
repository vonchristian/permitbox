class CreateBusinessFees < ActiveRecord::Migration[6.0]
  def change
    create_table :business_fees, id: :uuid do |t|
      t.integer :charge_scope
      t.string :name
      t.decimal :amount
      t.belongs_to :locality, null: false, foreign_key: true, type: :uuid 

      t.timestamps
    end
    add_index :business_fees, :charge_scope
  end
end
