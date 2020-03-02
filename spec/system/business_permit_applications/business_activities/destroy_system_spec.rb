require 'rails_helper'
include ChosenSelect

describe 'Destroy business permit application business activity' do
  before(:each) do
    locality = create(:locality)
    taxpayer                    = create(:taxpayer)
    locality_taxpayer           = create(:locality_taxpayer, taxpayer: taxpayer, locality: locality)
    @business = create(:business, locality: locality)
    business_permit_application = create(:business_permit_application, business: @business, locality: locality)
    @line_of_business           = create(:line_of_business, locality: locality, fee_amount: 100)
    @business_activity          = create(:business_activity, business: @business, line_of_business: @line_of_business)
    bplo_officer                = create(:bplo_officer, locality: locality)
    login_as(bplo_officer, scope: :user)
    visit gov_module_permit_applications_business_permit_application_path(business_permit_application)
  end

  it 'with valid attributes', js: true do 
    page.execute_script "window.scrollBy(0,1000)"
    
    click_link "#{@business_activity.id}-cancel-business-activity"

    expect(@business.business_activities.not_cancelled).to_not include(@business_activity)
  end 
end 