class AddBusinessToBusinessPermitApplications < ActiveRecord::Migration[5.2]
  def change
    add_reference :business_permit_applications, :business, foreign_key: true, type: :uuid
    add_reference :business_permit_applications, :locality, foreign_key: true, type: :uuid
    add_reference :business_permit_applications, :barangay, foreign_key: true, type: :uuid
    add_reference :business_permit_applications, :province, foreign_key: true, type: :uuid
    add_column :business_permit_applications, :business_name, :string
    add_reference :business_permit_applications, :ownership_type, foreign_key: true, type: :uuid
    add_column :business_permit_applications, :mode_of_payment, :integer
    add_index :business_permit_applications, :mode_of_payment
    add_column :business_permit_applications, :complete_address, :string
    add_reference :business_permit_applications, :street, foreign_key: true, type: :uuid
    add_column :business_permit_applications, :rented, :boolean
    add_column :business_permit_applications, :monthly_rental, :decimal
    add_column :business_permit_applications, :market_vendor, :boolean
    add_reference :business_permit_applications, :public_market, foreign_key: true, type: :uuid
    add_column :business_permit_applications, :tenancy_type, :integer
    add_index :business_permit_applications, :tenancy_type
    add_column :business_permit_applications, :business_area, :decimal
    add_reference :business_permit_applications, :business_tax_category, foreign_key: true, type: :uuid
    add_column :business_permit_applications, :employee_count, :integer
    add_column :business_permit_applications, :gross_sale_amount, :decimal
    add_column :business_permit_applications, :gross_sale_calendar_year, :integer
    add_column :business_permit_applications, :capital_amount, :decimal
  end
end
