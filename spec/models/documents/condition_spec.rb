require 'rails_helper'

module Documents
  describe Condition do
    describe 'associations' do
      it { is_expected.to belong_to :document }
    end
  end
end
