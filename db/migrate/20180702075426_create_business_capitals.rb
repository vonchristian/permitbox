class CreateBusinessCapitals < ActiveRecord::Migration[5.2]
  def change
    create_table :business_capitals, id: :uuid do |t|
      t.belongs_to :business, foreign_key: true, type: :uuid
      t.decimal :capital_amount
      t.datetime :date

      t.timestamps
    end
  end
end
