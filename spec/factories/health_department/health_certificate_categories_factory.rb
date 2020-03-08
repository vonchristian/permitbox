FactoryBot.define do
  factory :health_certificate_category, class: HealthDepartment::HealthCertificateCategory do
    title { Faker::Company.bs }
  end
end
