class CreateLaboratories < ActiveRecord::Migration[6.0]
  def change
    create_table :laboratories, id: :uuid do |t|
      t.string :business_name
      t.string :address
      t.string :contact_number
      t.string :owner_name
      t.belongs_to :locality, null: false, foreign_key: true, type: :uuid 
     
      t.timestamps
    end
  end
end
