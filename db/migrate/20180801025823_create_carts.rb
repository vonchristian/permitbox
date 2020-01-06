class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts, id: :uuid do |t|
      t.belongs_to :taxpayer, foreign_key: true, type: :uuid
      t.belongs_to :user, foreign_key: true, type: :uuid
      t.belongs_to :ownership_type, foreign_key: true, type: :uuid
      t.decimal :asset_size
      t.decimal :capital
      t.string :name
      t.timestamps
    end
  end
end
