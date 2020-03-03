require 'rails_helper'

describe 'New business business charge' do 
  before(:each) do 
    bplo_officer = create(:bplo_officer)
    charge       = create(:charge, charge_scope: 'for_business', amount: 1000, locality: bplo_officer.locality)
    business     = create(:business, locality: bplo_officer.locality)

    login_as(bplo_officer)

    visit new_gov_module_business_assessment_line_item_path(business)
    click_link 'Add Charges'
  end 

  it 'with valid attributes', js: true do 
    click_button "Add", match: :first

    expect(page).to have_content('added successfully')
  end 
end 

