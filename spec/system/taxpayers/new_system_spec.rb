require 'rails_helper'
include ChosenSelect

describe 'New taxpayer' do
  before(:each) do
    user     = create(:user, role: :bplo_officer)
    barangay = create(:barangay, locality: user.locality, name: 'Poblacion')
    
    login_as(user, :scope => :user)
    
    visit gov_module_taxpayers_path
    click_link 'New Taxpayer'
  end
  it 'with valid attributes', js: true do
    fill_in 'First name',     with: "Juan"
    fill_in "Middle name",    with: 'Dela'
    fill_in "Last name",      with: 'Cruz'
    fill_in 'Contact number', with: '24234'
    choose 'Male'
    select_from_chosen 'Poblacion', from: 'Barangay'
    fill_in 'Complete address', with: 'test address'

    click_button "Save Taxpayer"

    expect(page).to have_content 'created successfully'
  end
  it 'with invalid attributes' do

    click_button 'Save Taxpayer'

    expect(page).to have_content("can't be blank")
  end
end
