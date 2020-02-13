class AddBusinessTaxRevenueAccountToBusinessPermitApplications < ActiveRecord::Migration[6.0]
  def change
    add_reference :business_permit_applications, :business_tax_revenue_account, foreign_key: { to_table: :accounts }, type: :uuid, index: { name: 'index_business_tax_rev_account_on_business_permit_applications' } 
  end
end
