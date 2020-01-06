class AddGrossSaleAmountToBusinessPermitApplication < ActiveRecord::Migration[5.2]
  def change
    add_column :business_permit_applications, :gross_sale_amount, :decimal, default: 0
  end
end
