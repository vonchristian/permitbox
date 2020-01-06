class AddProvinceToLocalities < ActiveRecord::Migration[5.2]
  def change
    add_reference :localities, :province, foreign_key: true, type: :uuid
  end
end
