require 'rails_helper'

describe 'Edit Gross sale feature' do
  it 'with valid attributes' do
    user = create(:user, role: :bplo_officer)
    login_as(user, :scope => :user)
    business_tax_category = create(:business_tax_category)
    charge = create(:charge, revenue_account: business_tax_category.revenue_account)

    gross_sales_tax_range = create(:gross_sales_tax_range, minimum_gross_sale: 1, maximum_gross_sale: 100_000, charge: charge)

    business = create(:business)
    gross_sale = create(:gross_sale, business: business, amount: 90000)
    chargeable = create(:chargeable, chargeable: business, charge: charge)
    visit gov_module_business_url(business)

    expect(page).to have_content("₱90,000.00")
    click_link 'Destroy'
    expect(page).to_not have_content("₱90,000.00")
  end
end


