require 'rails_helper'

describe 'New business activity system spec' do
  let (:business) { create(:business) }
  before(:each) do
    user = create(:user, role: :bplo_officer)
    login_as(user, :scope => :user)
    line_of_business = create(:line_of_business)
    visit business_url(business)
    click_link 'New Business Activity'
  end

  it "with valid attributes" do
    fill_in 'Quantity', with: 1
    click_button "Add"

    expect(page).to have_content("added successfully")
    expect(business.line_of_businesses.count).to eql 1
  end
end
