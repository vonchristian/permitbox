class CreateDiscountableDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :discountable_discounts, id: :uuid do |t|
      t.references :discountable, polymorphic: true, type: :uuid, index: { name: 'index_discountable_on_discountable_discounts' }
      t.belongs_to :discount, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
