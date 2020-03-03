require 'rails_helper'

describe 'New business gross sale' do 
  before(:each) do 
    bplo_officer          = create(:bplo_officer)
    business_tax_category = create(:business_tax_category)
    gross_sale_tax_range  = create(:gross_sales_tax_range, business_tax_category: business_tax_category, minimum_gross_sale: 0, maximum_gross_sale: 100_000_000, tax_type: 'amount', tax_amount: 10_000)
    business              = create(:business, locality: bplo_officer.locality, business_tax_category: business_tax_category)

    login_as(bplo_officer, scope: :user)
    
    visit new_gov_module_business_assessment_line_item_path(business)
    click_link 'New Gross Sale'
  end 

  it 'with valid attributes', js: true do 
    fill_in 'Amount', with: 50_000 
    choose 'Non Essential'
    choose 'Annually'
    page.execute_script "window.scrollBy(0,1000)"
    click_button 'Save Gross Sale'

    expect(page).to have_content("saved successfully.")
  end 

  it 'with invalid attributes' do 
    fill_in 'Amount', with: ''

    click_button 'Save Gross Sale'
    
    expect(page).to have_content("can't be blank")
  end 

end