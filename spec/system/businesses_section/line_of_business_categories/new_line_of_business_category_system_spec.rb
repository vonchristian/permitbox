require 'rails_helper'

describe 'New Line of Business Category' do
  before(:each) do
    revenue_account = create(:revenue, name: "Mayors Permit Fee")
    user = create(:user, role: :assessing_officer)
    login_as(user, :scope => :user)

    visit businesses_section_settings_url
    click_link 'New Line Of Business Category'
  end
  it 'with valid attributes' do
    fill_in 'Title', with: "Manufacturers"
    select("Mayors Permit Fee", :from => "revenueAccountSelect")
    click_button "Create Line Of Business Category"

    expect(page).to have_content('created successfully')
  end
end
