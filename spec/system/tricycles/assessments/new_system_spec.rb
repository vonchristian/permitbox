require 'rails_helper'

describe 'New tricycle assessment' do 
  before(:each) do 
    bplo_officer = create(:bplo_officer)
    tricycle = create(:tricycle)
    @tricycle_permit_application = create(:tricycle_permit_application, locality: bplo_officer.locality, tricycle: tricycle)
    cart = create(:cart)
    tricycle_fee = create(:tricycle_fee, amount: 100, name: 'Permit Fee')
    tricycle_charge = create(:tricycle_charge, tricycle: tricycle)
    create(:credit_voucher_amount, account: tricycle_charge.revenue_account, amount: 100, name: 'Permit Fee')
    login_as(bplo_officer, scope: :user)

    visit gov_module_permit_applications_tricycle_permit_application_path(@tricycle_permit_application)
    click_link 'Proceed to Assessment'
  end 

  it 'with valid attributes', js: true do 
    fill_in 'Date', with: Date.current 


    click_button 'Create Assessment'

    expect(page).to have_content('saved successfully')
  end 
end 