require 'rails_helper'

describe 'New Gross sale feature' do
  before(:each) do
    user = create(:user, role: :assessing_officer)
    login_as(user, :scope => :user)
    business = create(:business)
    visit business_url(business)
    click_link 'New Gross Sale'
  end

  it 'with valid attributes' do
    fill_in 'Amount', with: 50_000
    fill_in 'Calendar year', with: Date.today.last_year
    click_button "Save Gross Sale"

    expect(page).to have_content('saved successfully')
  end
end


