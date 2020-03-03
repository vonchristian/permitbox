FactoryBot.define do
  factory :province, class: Locations::Province do
    association :region
    name { Faker::Address.street_name }
  end
end
