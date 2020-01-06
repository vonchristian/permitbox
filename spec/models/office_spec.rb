require 'rails_helper'

describe Office do
  describe 'associations' do
    it { is_expected.to have_many :documents }
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
  end
end
