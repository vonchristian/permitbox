module HealthDepartment
  class HealthCertificate < ApplicationRecord
    belongs_to :employee, class_name: "Businesses::Employee"
    belongs_to :health_certificate_category
  end
end 