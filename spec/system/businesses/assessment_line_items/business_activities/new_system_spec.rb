require 'rails_helper'

describe 'New business business activity' do 
  before(:each) do 
    bplo_officer     = create(:bplo_officer)
    line_of_business = create(:line_of_business, locality: bplo_officer.locality, name: 'test', fee_amount: 1000)
    business         = create(:business, locality: bplo_officer.locality)
    login_as(bplo_officer, scope: :user)

    visit new_gov_module_business_assessment_line_item_path(business)
    click_link 'Add Business Activity'
  end 

  it 'with valid attributes', js: true do 
    fill_in 'business-activity-quantity', with: 1
    click_button "Add Activity", match: :first

    expect(page).to have_content('added successfully')
  end 
end 