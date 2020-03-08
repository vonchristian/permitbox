module HealthDepartment
  class HealthCertificateCategory < ApplicationRecord
    validates :title, presence: true, uniqueness: true
  end
end 