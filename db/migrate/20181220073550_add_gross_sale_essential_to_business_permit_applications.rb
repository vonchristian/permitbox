class AddGrossSaleEssentialToBusinessPermitApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :business_permit_applications, :gross_sale_essential, :boolean, default: false
  end
end
