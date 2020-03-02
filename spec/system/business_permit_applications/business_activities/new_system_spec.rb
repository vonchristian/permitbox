require 'rails_helper'
include ChosenSelect

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

    click_link 'add-business-activities'
  end

  it 'with valid attributes', js: true do 
    page.execute_script "window.scrollBy(0,1000)"
    fill_in 'business-activity-quantity', with: 1
    click_button "Add Activity", match: :first

    expect(page).to have_content(@line_of_business.name)
    expect(page).to have_content(@line_of_business.fee_amount)

  end 
end 