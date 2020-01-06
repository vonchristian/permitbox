require 'rails_helper'

describe 'New Business Tax Category' do
  before(:each) do
    user = create(:user, role: :assessing_officer)
    login_as(user, :scope => :user)
    business_tax_category = create(:business_tax_category)
    visit businesses_section_business_tax_category_url(business_tax_category)
    click_link 'New Gross Sales Tax Range'
  end
  it 'with valid attributes' do
    fill_in 'Minimum gross sale', with: 200
    fill_in 'Maximum gross sale', with: 1000
    fill_in 'Tax per Annum', with: 50
    click_button "Create Gross Sales Tax Range"

    expect(page).to have_content('created successfully')
  end
end
