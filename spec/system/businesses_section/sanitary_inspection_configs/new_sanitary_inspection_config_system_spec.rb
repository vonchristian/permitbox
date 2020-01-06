require 'rails_helper'

describe 'New Sanitary inspection config' do
  before(:each) do
    user = create(:user, role: :bplo_officer)
    login_as(user, :scope => :user)
    revenue_account = create(:revenue, name: "Sanitary Inspection Fees")
    visit businesses_section_settings_url
    click_link 'New Sanitary Inspection Config'
  end

  it 'with valid attributes' do
    fill_in 'Minimum area', with: 1
    fill_in 'Maximum area', with: 1000
    fill_in 'Fee amount', with: 50
    select("Sanitary Inspection Fees", :from => "revenueAccountSelect")
    click_button "Create Sanitary Inspection Config"

    expect(page).to have_content('created successfully')
  end
end
