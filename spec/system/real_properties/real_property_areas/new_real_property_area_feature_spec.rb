require 'rails_helper'

describe 'New real property area' do
  before(:each) do
    user = create(:user, role: :assessing_officer)
    login_as(user, :scope => :user)
    real_property = create(:land)
    visit real_property_path(real_property)
    click_link 'New Real Property Area'
  end
  scenario 'with valid attributes' do
    fill_in "Area", with: 50
    fill_in 'Effectivity date', with: Date.today
    click_button "Save Real Property Area"

    expect(page).to have_content("successfully")

  end
end
