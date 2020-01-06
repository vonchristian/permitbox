class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies, id: :uuid do |t|
      t.string :name
      t.belongs_to :locality, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
