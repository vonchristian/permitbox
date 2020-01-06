class CreateEmployeeCounts < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_counts, id: :uuid do |t|
      t.integer :total_count, default: 0, null: false
      t.datetime :date
      t.belongs_to :business, foreign_key: true, type: :uuid
      t.belongs_to :locality, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
