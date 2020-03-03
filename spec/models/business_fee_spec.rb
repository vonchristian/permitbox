require 'rails_helper'

describe BusinessFee do
  describe 'associations' do 
    it { is_expected.to belong_to :locality }
  end 
end
