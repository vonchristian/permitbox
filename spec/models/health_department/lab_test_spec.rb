require 'rails_helper'
module HealthDepartment
  describe LabTest do
    describe "associations" do 
      it { is_expected.to belong_to :locality }
    end 
    describe "validations" do 
      it { is_expected.to validate_presence_of :title }
    end 
  end 
end
