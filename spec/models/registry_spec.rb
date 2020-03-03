require 'rails_helper'

describe Registry do
  describe 'associations' do 
    it { is_expected.to belong_to :locality }
    it { is_expected.to belong_to :employee }
  end 
end 
