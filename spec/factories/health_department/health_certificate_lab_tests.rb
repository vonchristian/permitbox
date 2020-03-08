FactoryBot.define do
  factory :health_certificate_lab_test do
    laboratory { nil }
    lab_test { nil }
    health_certificate { nil }
    result { 1 }
    date { "2020-03-08 20:50:42" }
  end
end
