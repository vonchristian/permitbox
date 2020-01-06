class CreateGrossSales < ActiveRecord::Migration[5.2]
  def change
    create_table :gross_sales, id: :uuid do |t|
      t.belongs_to :business, foreign_key: true, type: :uuid
      t.decimal :bamount
      t.datetime :date

      t.timestamps
    end
  end
end
