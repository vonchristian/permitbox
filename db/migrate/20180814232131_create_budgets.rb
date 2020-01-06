class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets, id: :uuid do |t|
      t.belongs_to :account, foreign_key: true, type: :uuid
      t.decimal :amount
      t.integer :calendar_year
      t.datetime :date
      t.belongs_to :user, foreign_key: true, type: :uuid
      t.belongs_to :locality, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
