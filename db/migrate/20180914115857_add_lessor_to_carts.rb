class AddLessorToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :lessor_name, :string
    add_column :carts, :lessor_address, :string
    add_column :carts, :lessor_email, :string
    add_column :carts, :lessor_contact_number, :string
  end
end
