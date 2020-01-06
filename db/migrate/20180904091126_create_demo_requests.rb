class CreateDemoRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :demo_requests, id: :uuid do |t|
      t.string :email
      t.string :locality
      t.string :message

      t.timestamps
    end
  end
end
