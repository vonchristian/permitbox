class CreateBusinessEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :business_employees, id: :uuid do |t|
      t.belongs_to :business, null: false, foreign_key: true, type: :uuid 
      t.belongs_to :employee, null: false, foreign_key: { to_table: :taxpayers }, type: :uuid 

      t.timestamps
    end
  end
end
