require 'rails_helper'

module HealthDepartment
  module Laboratories 
    describe LaboratoryLabTest do
      describe "associations" do 
        it { is_expected.to belong_to :laboratory }
        it { is_expected.to belong_to :lab_test }
      end 
      describe "validations" do 
        it { is_expected.to validate_presence_of :fee_amount }
        it { is_expected.to validate_numericality_of :fee_amount }
      end 
    end 
  end 
end
