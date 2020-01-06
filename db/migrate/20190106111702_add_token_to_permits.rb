class AddTokenToPermits < ActiveRecord::Migration[5.2]
  def change
    add_column :permits, :token, :string
  end
end
