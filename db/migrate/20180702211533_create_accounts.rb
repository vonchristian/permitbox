class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts, id: :uuid do |t|
      t.string :name
      t.string :code
      t.boolean :contra, default: false
      t.string :type

      t.timestamps
    end
    add_index :accounts, :type
  end
end
