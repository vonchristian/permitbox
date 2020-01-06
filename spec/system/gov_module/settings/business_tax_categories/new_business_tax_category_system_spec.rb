require 'rails_helper'

describe 'New Business Tax Category' do
  before(:each) do
    locality = create(:locality)
    revenue_account  = create(:revenue, name: "Business Tax")
    discount_account = create(:revenue, name: "Discount Business Tax")
    user             = create(:user, role: :bplo_officer, locality: locality)
    locality.accounts << revenue_account
    locality.accounts << discount_account
    login_as(user, :scope => :user)

    visit gov_module_bplo_settings_url
    click_link 'Business Tax Categories'
    click_link 'New Business Tax Category'
  end
  it 'with valid attributes' do
    fill_in 'Title',       with: "Manufacturers"
    fill_in 'Description', with: "Manufacturers business tax Category"
    select("Business Tax", :from => "business-tax-category-revenue-account")
    select("Discount Business Tax", :from => "business-tax-category-discount-account")
    click_button "Create Business Tax Category"


    expect(page).to have_content('created successfully')
  end
end
