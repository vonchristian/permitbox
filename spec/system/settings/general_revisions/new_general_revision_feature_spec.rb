require 'rails_helper'

describe 'New general revision' do
  before(:each) do
    user = create(:user, role: :assessing_officer)
    login_as(user, :scope => :user)
    real_property = create(:land)
    visit settings_url
    click_link 'New General Revision'
  end
  scenario 'with valid attributes' do
    fill_in 'Title', with: "General Revision 2014"
    fill_in "Effectivity year", with: '12/31/2014'
    click_button "Create General Revision"

    expect(page).to have_content 'created successfully'
  end
end
