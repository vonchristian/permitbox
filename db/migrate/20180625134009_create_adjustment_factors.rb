class CreateAdjustmentFactors < ActiveRecord::Migration[5.2]
  def change
    create_table :adjustment_factors, id: :uuid do |t|
      t.string :title
      t.string :description
      t.decimal :percent
      t.decimal :amount
      t.integer :adjustment_type

      t.timestamps
    end
    add_index :adjustment_factors, :adjustment_type
  end
end
