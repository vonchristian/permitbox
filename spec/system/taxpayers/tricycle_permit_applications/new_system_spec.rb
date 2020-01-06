require 'rails_helper'

describe 'New tricycle permit application' do
  before(:each) do
    locality = create(:locality)
    taxpayer = create(:taxpayer)
    user     = create(:user, role: :bplo_officer, locality: locality)
    toda     = create(:tricycle_organization, abbreviated_name: "LAGAWETODA", locality: locality)
    barangay = create(:barangay, name: 'Poblacion', locality: locality)
    revenue_account = create(:revenue, name: 'Permit Fee')
    charge          = create(:charge, name: 'Permit Fee', revenue_account: revenue_account, amount: 100, charge_scope: 'for_tricycle', locality: locality)
    locality.taxpayers << taxpayer
    locality.accounts << revenue_account
    login_as(user, scope: :user)
    visit gov_module_taxpayer_path(taxpayer)
    click_link "#{taxpayer.id}-tricycles"
    click_link 'New Application'
  end

  it 'with valid attributes' do
    fill_in 'Application date', with: Date.current
    fill_in 'Application number', with: '3131313'
    choose 'New Application'
    fill_in 'MTOP Number', with: '3131'
    fill_in 'Plate number', with: '313213'
    fill_in 'Make/Brand', with: 'Kawasaki'
    fill_in 'Tricycle model', with: 'NS160'
    fill_in 'Color', with: 'Black'
    select 'LAGAWETODA'

    click_button 'Save Application'
    save_and_open_page
  end
end
