require 'rails_helper'

describe 'New assessment' do
  it 'with valid attributes' do
    locality = create(:locality)

    user     = create(:user, role: :bplo_officer, locality: locality)
    toda     = create(:tricycle_organization, abbreviated_name: "LAGAWETODA", locality: locality)
    barangay = create(:barangay, name: 'Poblacion', locality: locality)
    revenue_account    = create(:revenue, name: 'Permit Fee')
    charge             = create(:charge, name: 'Permit Fee', revenue_account: revenue_account, amount: 100, charge_scope: 'for_tricycle', locality: locality)
    tricycle           = create(:tricycle, tricycle_organization: toda, locality: locality)
    permit_application = create(:tricycle_permit_application, applicant: tricycle, locality: locality)
login_as(user, scope: :user)
    cart = create(:cart)

    Tricycles::ChargeSetter.new(tricycle: tricycle, cart: cart).set_charges!



    visit gov_module_permit_applications_tricycle_permit_application_path(permit_application)
    save_and_open_page
  end
end
