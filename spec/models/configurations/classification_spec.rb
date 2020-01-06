require 'rails_helper'

module Configurations
  describe Classification do
    describe 'associations' do
      it { is_expected.to have_many :sub_classifications }
    end
  end
end
