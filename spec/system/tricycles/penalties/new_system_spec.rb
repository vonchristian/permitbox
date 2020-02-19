require 'rails_helper'

describe 'New tricycle penalty' do 
  before(:each) do 
    bplo_officer = create(:bplo_officer)
    @tricycle_permit_application = create(:tricycle_permit_application, locality: bplo_officer.locality)
    login_as(bplo_officer, scope: :user)

    visit gov_module_permit_applications_tricycle_permit_application_path(@tricycle_permit_application)
    click_link 'Add Penalty'
  end 

  it 'with valid attributes', js: true do 
    fill_in 'Amount', with: 100

    click_button 'Add Penalty'

    expect(page).to have_content('added successfully')
  end 
end 