FactoryBot.define do
  factory :street, class: Locations::Street do
    association :barangay
    name { Faker::Address.street_name }
  end
end
