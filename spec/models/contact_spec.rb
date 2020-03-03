require 'rails_helper'

describe Contact do
  describe 'associations' do 
    it { is_expected.to belong_to :contactable }
  end 
end
 