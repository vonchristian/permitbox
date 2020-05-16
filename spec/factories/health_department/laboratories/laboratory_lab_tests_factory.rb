FactoryBot.define do
  factory :laboratory_lab_test, class: HealthDepartment::Laboratories::LaboratoryLabTest do
    association :laboratory
    association :lab_test
    fee_amount { 100 }
  end
end
