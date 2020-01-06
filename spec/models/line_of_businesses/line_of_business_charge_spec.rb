require 'rails_helper'

module LineOfBusinesses
  describe LineOfBusinessCharge do
    describe 'associations' do
      it { is_expected.to belong_to :revenue_account }
      it { is_expected.to belong_to :line_of_business }
    end
    describe 'validations' do
      it { is_expected.to validate_presence_of :amount }
      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_numericality_of(:amount) }
    end
  end
end
