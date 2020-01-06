class AddCartToLineOfBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_reference :line_of_businesses, :cart, foreign_key: true, type: :uuid
  end
end
