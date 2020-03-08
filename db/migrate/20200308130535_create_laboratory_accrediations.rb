class CreateLaboratoryAccrediations < ActiveRecord::Migration[6.0]
  def change
    create_table :laboratory_accrediations, id: :uuid do |t|
      t.belongs_to :locality, null: false, foreign_key: true, type: :uuid 
      t.belongs_to :laboratory, null: false, foreign_key: true, type: :uuid 
      t.string :accreditation_number

      t.timestamps
    end
  end
end
