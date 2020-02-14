require 'rails_helper'

module Tricycles
  describe TricycleFee do
    describe 'associations' do 
      it { is_expected.to belong_to :locality }
    end 
    describe 'validations' do 
      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_presence_of :amount }
      it { is_expected.to validate_presence_of :charge_scope }
      it { is_expected.to validate_numericality_of :amount }
    end 
    describe 'enums' do 
      it { is_expected.to define_enum_for(:charge_scope).with_values([:for_new_application, :for_renew_application, :applicable_to_all]) }
    end 
  end 
end
