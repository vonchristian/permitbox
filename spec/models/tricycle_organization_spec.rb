require 'rails_helper'

describe TricycleOrganization do
  describe 'associations' do 
    it { is_expected.to belong_to :locality }
    it { is_expected.to have_many :tricycles }
  end 
  
  describe 'validations' do 
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :abbreviated_name }
  end 
end
