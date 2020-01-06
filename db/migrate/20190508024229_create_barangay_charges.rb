class CreateBarangayCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :barangay_charges, id: :uuid do |t|
      t.belongs_to :barangay, foreign_key: true, type: :uuid
      t.belongs_to :charge, foreign_key: true, type: :uuid 

      t.timestamps
    end
  end
end
