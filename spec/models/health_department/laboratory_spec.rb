require 'rails_helper'

module HealthDepartment
  describe Laboratory do
    describe "associations" do 
      it { is_expected.to belong_to :locality }
      it { is_expected.to have_many :laboratory_lab_tests }
      it { is_expected.to have_many :lab_tests }
    end 
  end 
end
