require 'rails_helper'

describe 'Taxpayer settings index page' do
  before(:each) do
    locality          = create(:locality)
    user              = create(:user, role: :bplo_officer, locality: locality)
    taxpayer          = create(:taxpayer)
    locality_taxpayer = create(:locality_taxpayer, taxpayer: taxpayer, locality: locality)
    login_as(user, :scope => :user)
    visit gov_module_taxpayer_url(taxpayer)
    click_link 'Taxpayer Settings'

  end
  it 'valid' do
  end
end
