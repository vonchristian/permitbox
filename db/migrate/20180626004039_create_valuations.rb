class CreateValuations < ActiveRecord::Migration[5.2]
  def change
    create_table :valuations, id: :uuid do |t|
      t.references :valuable, polymorphic: true, type: :uuid
      t.datetime :effectivity_date
      t.decimal :assessed_value

      t.timestamps
    end
  end
end
