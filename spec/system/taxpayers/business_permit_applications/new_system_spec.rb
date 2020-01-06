require 'rails_helper'

describe 'New business permit application' do
  before(:each) do
    locality = create(:locality)
    taxpayer              = create(:taxpayer)
    locality_taxpayer     = create(:locality_taxpayer, taxpayer: taxpayer, locality: locality)
    user                  = create(:user, role: 'bplo_officer', locality: locality)
    ownership_type        = create(:ownership_type, title: 'Sole Proprietorship', locality: locality)
    business_tax_category = create(:business_tax_category, title: 'Retailers', locality: locality)
    barangay = create(:barangay, name: 'Poblacion', locality: locality)
    line_of_business = create(:line_of_business, name: 'Sari-Sari Store', locality: locality, fee_amount: 500)
    police_clearance_fee = create(:charge, default_charge: true, locality: locality, amount: 50, charge_scope: 'for_business', name: 'Police Clearance Fee')
    health_fee = create(:charge, default_charge: true, locality: locality, amount: 50, charge_scope: 'for_business', name: 'Health Certificate Fee')
    barangay_clearance_fee = create(:charge, locality: locality, amount: 45, charge_scope: 'for_business', name: 'Barangay Clearance Fee' )
    barangay.charges << barangay_clearance_fee
    login_as(user, scope: :user)
    visit gov_module_taxpayer_url(taxpayer)
    click_link "#{taxpayer.id}-businesses"
    click_link 'New Application'
  end


  it 'with valid attributes' do
    fill_in 'Application date', with: Date.current
    fill_in 'Application number', with: '32131312'
    fill_in 'Business name', with: 'test business name'
    fill_in 'Number of employees', with: 1
    choose 'Annually'
    select 'Sole Proprietorship'
    select 'Retailers'
    select 'Sari-Sari Store'
    fill_in 'Complete address', with: 'Lagawe, Ifugao'
    select 'Poblacion'
    fill_in 'Business area(in sq.m.)', with: 50

    click_button 'Save Permit Application'
    save_and_open_page
  end
end
