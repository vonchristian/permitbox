module HealthDepartment
  class HealthCertificateApplication < ApplicationRecord
    belongs_to :applicant, polymorphic: true
    belongs_to :health_certificate
    belongs_to :locality
  end
end 