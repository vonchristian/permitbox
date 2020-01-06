class CreateTenancies < ActiveRecord::Migration[5.2]
  def change
    create_table :tenancies, id: :uuid do |t|
      t.references :tenant, polymorphic: true, type: :uuid
      t.belongs_to :public_market, foreign_key: true, type: :uuid
      t.integer :tenancy_type, index: true
      t.timestamps
    end
  end
end
