require 'rails_helper'

describe 'New classification feature' do
  before(:each) do
    user = create(:user, role: :assessing_officer)
    login_as(user, :scope => :user)
    real_property = create(:land)
    visit settings_url
    click_link 'New Classification'
  end

  scenario 'with valid attributes' do
    fill_in 'Title', with: "Agricultural"
    click_button "Create Classification"

    expect(page).to have_content 'created successfully'
  end
end
