require 'rails_helper'

describe 'New Document system spec' do
  before(:each) do
    locality = create(:locality)
    office = create(:office, locality: locality, name: "Engineering Office")
    user = create(:user, locality: locality)
    login_as(user, :scope => :user)
    visit businesses_section_settings_url
    click_link 'New Requirement'
  end
  it 'with valid attributes' do
    fill_in 'Title', with: "Manufacturers"
    fill_in 'Description', with: "Manufacturers business tax Category"
    save_and_open_page

    select("Engineering Office", :from => "officeSelect")
    click_button "Create Requirement"


    expect(page).to have_content('created successfully')
  end
end
