module HealthDepartment
  class Laboratory < ApplicationRecord
    belongs_to :locality,           class_name: "Locations::Locality"
    has_many :laboratory_lab_tests, class_name: "HealthDepartment::Laboratories::LaboratoryLabTest"
    has_many :lab_tests,            class_name: "HealthDepartment::LabTest", through: :laboratory_lab_tests 

  end
end 