class CreatePermitSignatories < ActiveRecord::Migration[5.2]
  def change
    create_table :permit_signatories, id: :uuid do |t|
      t.belongs_to :permit, foreign_key: true, type: :uuid
      t.belongs_to :signatory, foreign_key: true, type: :uuid 

      t.timestamps
    end
  end
end
