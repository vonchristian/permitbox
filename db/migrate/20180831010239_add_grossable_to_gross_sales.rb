class AddGrossableToGrossSales < ActiveRecord::Migration[5.2]
  def change
    add_reference :gross_sales, :grossable, polymorphic: true, type: :uuid
  end
end
