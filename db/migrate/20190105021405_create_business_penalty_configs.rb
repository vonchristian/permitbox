class CreateBusinessPenaltyConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :business_penalty_configs, id: :uuid do |t|
      t.decimal :rate
      t.belongs_to :locality, foreign_key: true, type: :uuid
      t.belongs_to :revenue_account, foreign_key: { to_table: :accounts }, type: :uuid

      t.timestamps
    end
  end
end
