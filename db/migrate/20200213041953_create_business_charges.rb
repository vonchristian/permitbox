class CreateBusinessCharges < ActiveRecord::Migration[6.0]
  def change
    create_table :business_charges, id: :uuid do |t|
      t.belongs_to :business, foreign_key: true, type: :uuid 
      t.belongs_to :business_permit_application, foreign_key: true, type: :uuid 
      t.belongs_to :revenue_account, null: false, foreign_key: { to_table: :accounts }, type: :uuid 
      t.belongs_to :charge, null: false, type: :uuid 

      t.timestamps
    end
  end
end
