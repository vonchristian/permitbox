require 'rails_helper'

describe 'New business permit application assessment' do
  before(:each) do
    locality                     = create(:locality)
    taxpayer                     = create(:taxpayer)
    locality_taxpayer            = create(:locality_taxpayer, taxpayer: taxpayer, locality: locality)
    business_tax_category        = create(:business_tax_category, locality: locality)
    gross_sale_tax_range         = create(:gross_sales_tax_range, business_tax_category: business_tax_category, minimum_gross_sale: 0, maximum_gross_sale: 100_000_000, tax_type: 'amount', tax_amount: 10_000)
    business                     = create(:business, locality: locality)
    @business_permit_application = create(:business_permit_application, business_tax_category: business_tax_category, business: business, locality: locality, mode_of_payment: 'annually')
    line_of_business             = create(:line_of_business, locality: locality, fee_amount: 100)
    business_activity            = create(:business_activity, business: business, line_of_business: line_of_business)
    collection_officer           = create(:collection_officer, locality: locality)
    create(:employee_cash_account, employee: collection_officer, default_account: true)
    voucher = create(:voucher, payee: @business_permit_application)
    create(:credit_voucher_amount, voucher: voucher, account: @business_permit_application.business_tax_revenue_account, amount: 10_000)
    create(:credit_voucher_amount, voucher: voucher, account: business_activity.revenue_account, amount: 10_000)

    login_as(collection_officer, scope: :user)
     visit assessment_path(voucher)
     click_link 'Accept Payment'
  end


   it 'with valid attributes', js: true do 
    fill_in 'Official Receipt', with: 'test receipt'
    fill_in 'Date', with: Date.current 

    click_button 'Save Payment'

    expect(page).to have_content('saved successfully')
    expect(Accounting::Entry.count).to eql 1
   end 
end 