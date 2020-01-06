class RemoveGrossSalesFromBusinessPermitApplications < ActiveRecord::Migration[5.2]
  def change
    remove_column :business_permit_applications, :gross_sale_amount, :decimal
    remove_column :business_permit_applications, :gross_sale_calendar_year, :integer
    remove_column :business_permit_applications, :gross_sale_essential, :boolean
  end
end
