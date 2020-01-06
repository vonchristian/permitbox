require 'rails_helper'

describe Agency do
  describe 'associations' do
    it { is_expected.to have_many :users }
    it { is_expected.to have_many :documents }
    it { is_expected.to have_many :approved_documents }
  end
end
