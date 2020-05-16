FactoryBot.define do
  factory :health_certificate_application, class: HealthDepartment::HealthCertificateApplication do
    association :applicant, factory: :taxpayer
    association :health_certificate
    application_date { Date.current }
    association :locality
  end
end
