require 'rails_helper'

describe Budget, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :account }
    it { is_expected.to belong_to :locality }
  end
end
