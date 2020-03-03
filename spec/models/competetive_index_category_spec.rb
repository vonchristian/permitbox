require 'rails_helper'

describe CompetetiveIndexCategory, type: :model do
  describe 'associations' do 
    it { is_expected.to have_many :line_of_businesses }
    it { is_expected.to have_many :businesses }
  end 
  
  describe 'validations' do 
    it { is_expected.to validate_presence_of :name }
  end 
end
