require 'rails_helper'

describe 'New business permit application business activity' do
    before(:each) do
      locality = create(:locality)
      taxpayer                    = create(:taxpayer)
      locality_taxpayer           = create(:locality_taxpayer, taxpayer: taxpayer, locality: locality)
      business                    = create(:business, locality: locality)
      business_permit_application = create(:business_permit_application, business: business, locality: locality)
      @line_of_business           = create(:line_of_business, locality: locality, fee_amount: 100)
      bplo_officer                = create(:bplo_officer, locality: locality)
      login_as(bplo_officer, scope: :user)
      visit gov_module_permit_applications_business_permit_application_path(business_permit_application)
  
      click_link 'add-business-capital'
    end

    it 'with valid attributes', js: true do 
      fill_in 'Amount', with: 50_000 

      click_button 'Save Capital'

      expect(page).to have_content('saved successfully')
    end 

    it 'with blank attributes', js: true do 
      fill_in 'Amount', with: ""

      click_button 'Save Capital'

      expect(page).to have_content("can't be blank")
    end 
end 