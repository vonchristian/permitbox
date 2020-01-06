FactoryBot.define do
  factory :barangay, class: Locations::Barangay do
    association :locality
    name { Faker::Address.street }
  end
end
