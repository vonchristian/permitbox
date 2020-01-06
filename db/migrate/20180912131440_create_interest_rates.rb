class CreateInterestRates < ActiveRecord::Migration[5.2]
  def change
    create_table :interest_rates, id: :uuid do |t|
      t.belongs_to :locality, foreign_key: true, type: :uuid
      t.decimal :rate

      t.timestamps
    end
  end
end
