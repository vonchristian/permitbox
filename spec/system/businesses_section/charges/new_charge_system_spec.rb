require 'rails_helper'

describe 'New charge system spec' do
  before(:each) do
    locality = create(:locality)
    office = create(:office, locality: locality)
    user = create(:user, locality: locality)
    login_as(user, :scope => :user)
    visit businesses_section_settings_url
    revenue_account = create(:revenue, name: "Garbage Fees")
    click_link 'New Charge'
  end

  it 'with valid attributes' do
    fill_in 'Name', with: 'Garbage Fee'
    fill_in 'Amount', with: 500
    select 'Garbage Fees'
    choose "For Business"

    click_button "Create Charge"

    expect(page).to have_content('created successfully')
  end
  it 'with invalid attributes' do
    click_button 'Create Charge'

    expect(page).to have_content "can't be blank"
  end
end
