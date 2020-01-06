require 'rails_helper'

describe User do
  describe 'associations' do
    it { is_expected.to belong_to :locality }
    it { is_expected.to belong_to :agency }
  end
end
