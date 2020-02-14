FactoryBot.define do
  factory :tricycle_fee, class: 'Tricycles::TricycleFee' do
    association :locality
    amount { "9.99" }
    name { Faker::Company.bs }
    charge_scope { 1 }
  end
end
