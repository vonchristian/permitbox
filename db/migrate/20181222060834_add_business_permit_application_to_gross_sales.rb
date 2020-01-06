class AddBusinessPermitApplicationToGrossSales < ActiveRecord::Migration[5.2]
  def change
    add_reference :gross_sales, :business_permit_application, foreign_key: true, type: :uuid
  end
end
