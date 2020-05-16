require 'rails_helper'

module Businesses 
  describe Employment do
    describe "associations" do 
      it { is_expected.to belong_to :business }
      it { is_expected.to belong_to :employee }
    end 
  end 
end
