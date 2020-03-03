require 'rails_helper'

describe 'New business permit application gross sales' do
  before(:each) do
    locality                    = create(:locality)
    business                    = create(:business, locality: locality)
    bplo_officer                = create(:bplo_officer, locality: locality)
    login_as(bplo_officer, scope: :user)
    visit new_gov_module_business_assessment_line_item_path(business)

    click_link 'Add Penalty'
  end

    it 'with valid attributes', js: true do 
      fill_in 'Amount', with: 50_000 
      
      click_button 'Save Penalty'
      expect(page).to have_content('saved successfully')
    end 

    it 'with blank attributes', js: true do 
      fill_in 'Amount', with: ""

      click_button 'Save Penalty'

      expect(page).to have_content("can't be blank")
    end 
end 