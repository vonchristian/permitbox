class CreateLaboratoryLabTests < ActiveRecord::Migration[6.0]
  def change
    create_table :laboratory_lab_tests, id: :uuid do |t|
      t.belongs_to :laboratory, null: false, foreign_key: true, type: :uuid 
      t.belongs_to :lab_test, null: false, foreign_key: true, type: :uuid 
      t.decimal :fee_amount, null: false 

      t.timestamps
    end
  end
end
