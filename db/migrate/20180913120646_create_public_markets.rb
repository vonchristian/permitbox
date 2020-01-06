class CreatePublicMarkets < ActiveRecord::Migration[5.2]
  def change
    create_table :public_markets, id: :uuid do |t|
      t.string :address
      t.belongs_to :locality, foreign_key: true, type: :uuid
      t.string :name

      t.timestamps
    end
  end
end
