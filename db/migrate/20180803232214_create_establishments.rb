class CreateEstablishments < ActiveRecord::Migration[5.2]
  def change
    create_table :establishments, id: :uuid do |t|
      t.belongs_to :business, foreign_key: true, type: :uuid
      t.boolean :leased
      t.decimal :area
      t.references :lessor, polymorphic: true, type: :uuid

      t.timestamps
    end
  end
end
