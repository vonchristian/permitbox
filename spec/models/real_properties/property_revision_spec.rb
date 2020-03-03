require 'rails_helper'

module RealProperties
  describe PropertyRevision do
    describe 'associations' do 
      it { is_expected.to belong_to :general_revision }
      it { is_expected.to belong_to :real_property }
    end 
  end
end
