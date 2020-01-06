require 'rails_helper'

describe LineOfBusinessCategory do
  describe 'associations' do
    it { is_expected.to belong_to :locality }
    it { is_expected.to belong_to :revenue_account }
    it { is_expected.to have_many :line_of_businesses }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
  end
end
