class CreateMachineries < ActiveRecord::Migration[5.2]
  def change
    create_table :machineries, id: :uuid do |t|
      t.string :description

      t.timestamps
    end
  end
end
