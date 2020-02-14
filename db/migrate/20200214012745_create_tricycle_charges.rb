class CreateTricycleCharges < ActiveRecord::Migration[6.0]
  def change
    create_table :tricycle_charges, id: :uuid do |t|
      t.belongs_to :tricycle, foreign_key: true, type: :uuid 
      t.belongs_to :tricycle_permit_application,  foreign_key: true, type: :uuid 
      t.belongs_to :revenue_account, null: false, foreign_key: { to_table: :accounts }, type: :uuid 
      t.belongs_to :charge, null: false, foreign_key: true, type: :uuid 

      t.timestamps
    end
  end
end
