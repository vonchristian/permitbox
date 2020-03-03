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
    bplo_officer                 = create(:bplo_officer, locality: locality)
    create(:credit_voucher_amount, cart: @business_permit_application.cart,  account: business.tax_revenue_account, amount: 10_000)
    create(:credit_voucher_amount, cart: @business_permit_application.cart, account: business_activity.revenue_account, amount: 10_000)

    login_as(bplo_officer, scope: :user)
   
  end


    it 'with valid attributes ', js: true do 
      visit gov_module_permit_applications_business_permit_application_path(@business_permit_application)
      click_link 'Proceed to Assessment'
      fill_in 'Date', with: Date.current 
      fill_in 'Reference number', with: 'test ref'
      fill_in 'Description',      with: 'test description'

      click_button 'Save Assessment'

      expect(page).to have_content('saved successfully')
    end 
end 