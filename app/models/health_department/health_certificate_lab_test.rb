module HealthDepartment
  class HealthCertificateLabTest < ApplicationRecord
    belongs_to :laboratory
    belongs_to :lab_test
    belongs_to :health_certificate
  end
end 