require 'rails_helper'

describe 'New Line Of Business system spec' do
  before(:each) do
    user = create(:user, role: :assessing_officer)
    login_as(user, :scope => :user)
    line_of_business_category = create(:line_of_business_category)
    visit businesses_section_line_of_business_category_url(line_of_business_category)
    click_link 'New Line Of Business'
  end
  it 'with valid attributes' do
    fill_in 'Name', with: "Agricultural Inputs"
    fill_in 'Fee amount', with: 1000
    click_button "Create Line Of Business"

    expect(page).to have_content('created successfully')
  end
end
