require 'rails_helper'

describe 'New business assessment line item' do 
  before(:each) do 
    bplo_officer = create(:bplo_officer)
    business     = create(:business, locality: bplo_officer.locality)
    login_as(bplo_officer)
    visit gov_module_business_path(business)
    click_link "#{business.id}-assessments"
  end 

  it 'is valid' do 
    click_link 'New Assessment'
    
  end 
end 
