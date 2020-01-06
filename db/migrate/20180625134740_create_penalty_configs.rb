class CreatePenaltyConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :penalty_configs, id: :uuid do |t|
      t.string :rate
      t.decimal :max_number_of_month

      t.timestamps
    end
  end
end
