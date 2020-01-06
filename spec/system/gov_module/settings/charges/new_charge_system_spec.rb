require 'rails_helper'

describe 'New charge' do
  before(:each) do
    locality = create(:locality)
    revenue  = create(:revenue, name: 'Revenue account')
    locality.accounts << revenue
    user     = create(:user, role: 'bplo_officer', locality: locality)
    login_as(user, scope: :user)
    visit gov_module_bplo_settings_url
    click_link 'Charges'
    click_link 'New Charge'
  end
  it 'with valid attributes' do
    fill_in 'Name', with: 'test charge'
    fill_in 'Amount', with: 50
    select 'Revenue account'
    click_button 'Create Charge'

    expect(page).to have_content('created successfully')


  end
end
