class CreateTricycleFees < ActiveRecord::Migration[6.0]
  def change
    create_table :tricycle_fees, id: :uuid do |t|
      t.belongs_to :locality, null: false, foreign_key: true, type: :uuid 
      t.decimal :amount
      t.string :name
      t.integer :charge_scope

      t.timestamps
    end
  end
end
