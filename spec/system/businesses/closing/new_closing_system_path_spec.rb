require 'rails_helper'

describe 'Business closing' do
  it 'with valid attributes' do
    locality = create(:locality)
    business = create(:business, closed_at: nil, locality: locality)
    user     = create(:user, locality: locality, role: 'bplo_officer')

    login_as(user, scope: :user)
    visit gov_module_businesses_path
    click_link business.name

    expect(business.closed?).to eql false
    click_link 'Business Settings'
    click_link 'Close Business'

    fill_in 'Date Closed', with: Date.current
    click_button 'Close Business'

    expect(business.closed?).to eql true

  end
end
