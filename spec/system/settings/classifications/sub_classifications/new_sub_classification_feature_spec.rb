require 'rails_helper'

describe 'New classification feature' do
  before(:each) do
    user = create(:user, role: :assessing_officer)
    login_as(user, :scope => :user)
    real_property = create(:land)
    classification = create(:classification, title: "Agricultural")
    visit settings_url
    click_link 'Agricultural'
    click_link 'New Sub Classification'
  end

  scenario 'with valid attributes' do
    fill_in 'Title', with: "Agricultural Level 2"
    click_button "Create Sub Classification"

    expect(page).to have_content 'created successfully'
  end
end
