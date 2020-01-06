FactoryBot.define do
  factory :permit_application do
    association :locality
    association :applicant, factory: :taxpayer
    application_date { "2019-05-08 16:37:35" }
    application_number { "MyString" }
    factory :tricycle_permit_application, class: PermitApplications::TricyclePermitApplication do
      association :permitable, factory: :tricycle
    end
  end
end
