require 'rails_helper'

describe 'New taxpayer feature' do
  before(:each) do
    user = create(:user, role: :bplo_officer)
    login_as(user, :scope => :user)
    visit gov_module_taxpayers_url
    click_link 'New Taxpayer'
  end
  it 'with valid attributes' do
    fill_in 'First name',  with: "Juan"
    fill_in "Middle name", with: 'Dela'
    fill_in "Last name",   with: 'Cruz'
    fill_in 'Contact number', with: '24234'
    choose 'Male'

    click_button "Save Taxpayer"

    expect(page).to have_content 'created successfully'
  end
  it 'with invalid attributes' do

    click_button 'Save Taxpayer'

    expect(page).to have_content("can't be blank")
  end
end
