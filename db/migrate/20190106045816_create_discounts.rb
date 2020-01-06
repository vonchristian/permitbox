class CreateDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :discounts, id: :uuid do |t|
      t.string :name
      t.integer :discount_scope
      t.integer :discount_type
      t.decimal :rate
      t.decimal :amount
      t.string :name
      t.string :discounted_account_ids, array: true, default: '{}'
      t.belongs_to :locality, foreign_key: true, type: :uuid
      t.belongs_to :discount_account, foreign_key: { to_table: :accounts }, type: :uuid



      t.timestamps
    end
    add_index :discounts, :discount_scope
    add_index :discounts, :discount_type
  end
end
