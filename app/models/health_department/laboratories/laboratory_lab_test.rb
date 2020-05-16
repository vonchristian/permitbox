module HealthDepartment
  module Laboratories 
    class LaboratoryLabTest < ApplicationRecord
      belongs_to :laboratory, class_name: "HealthDepartment::Laboratory"
      belongs_to :lab_test,   class_name: "HealthDepartment::LabTest"

      validates :fee_amount, presence: true, numericality: true 
    end
  end 
end 
