require 'rails_helper'

describe 'New business permit application gross sales' do
  before(:each) do
    locality                    = create(:locality)
    taxpayer                    = create(:taxpayer)
    locality_taxpayer           = create(:locality_taxpayer, taxpayer: taxpayer, locality: locality)
    business_tax_category       = create(:business_tax_category, locality: locality)
    gross_sale_tax_range        = create(:gross_sales_tax_range, business_tax_category: business_tax_category, minimum_gross_sale: 0, maximum_gross_sale: 100_000_000, tax_type: 'amount', tax_amount: 10_000)
    business                    = create(:business, locality: locality, business_tax_category: business_tax_category)
    business_permit_application = create(:business_permit_application, business_tax_category: business_tax_category, business: business, locality: locality, mode_of_payment: 'annually')

    bplo_officer                = create(:bplo_officer, locality: locality)
    login_as(bplo_officer, scope: :user)
    visit gov_module_permit_applications_business_permit_application_path(business_permit_application)

    click_link 'add-gross-sale'
  end

    it 'with valid attributes', js: true do 
      fill_in 'Amount', with: 50_000 
      choose 'Non Essential'
      choose 'Annually'
    page.execute_script "window.scrollBy(0,1000)"

      click_button 'Save Gross Sale'

      expect(page).to have_content('saved successfully')
    end 

    it 'with blank attributes', js: true do 
      fill_in 'Amount', with: ""

      click_button 'Save Gross Sale'

      expect(page).to have_content("can't be blank")
    end 
end 