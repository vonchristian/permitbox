require 'rails_helper'
feature 'New Line of Business Charge' do
  before(:each) do
    locality = create(:locality)
    revenue = create(:revenue, name: 'Cockpit Fees')
    locality.accounts << revenue
    line_of_business = create(:line_of_business, locality: locality)
    user = create(:user, role: :bplo_officer, locality: locality)
    login_as(user, :scope => :user)
    visit '/gov_module/bplo_settings'
    click_link 'Line of Business Settings'
    click_link line_of_business.name
    click_link 'New Charge'
  end
  it 'with valid attributes' do
    fill_in 'Name', with: 'Cockpit Fee'
    fill_in 'Amount', with: 100
    select 'Cockpit Fees'
    click_button 'Create Charge'

    expect(page).to have_content('created successfully')
  end
  it 'with invalid attributes' do
    click_button 'Create Charge'

    expect(page).to have_content("can't be blank")
  end
end
