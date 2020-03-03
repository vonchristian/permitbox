require 'rails_helper'

describe OwnershipType do
  describe 'associations' do 
    it { is_expected.to belong_to :locality }
    it { is_expected.to have_many :businesses }
    it { is_expected.to have_many :carts }
    it { is_expected.to belong_to(:agency).optional }
  end 
  
  describe 'validations' do 
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_uniqueness_of(:title).scoped_to(:locality_id) }
  end 
end
