class CreateArps < ActiveRecord::Migration[5.2]
  def change
    create_table :arps, id: :uuid do |t|
      t.boolean :cancelled
      t.integer :number
      t.integer :request_status
      t.belongs_to :real_property, polymorphic: true, type: :uuid

      t.timestamps
    end
  end
end
