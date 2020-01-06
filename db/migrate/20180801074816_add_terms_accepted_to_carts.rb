class AddTermsAcceptedToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :terms_accepted, :boolean, default: false
  end
end
