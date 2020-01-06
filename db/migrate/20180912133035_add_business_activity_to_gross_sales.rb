class AddBusinessActivityToGrossSales < ActiveRecord::Migration[5.2]
  def change
    add_reference :gross_sales, :business_activity, foreign_key: true, type: :uuid
  end
end
