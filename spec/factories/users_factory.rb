FactoryBot.define do
  factory :user do
    association :locality
    email                 { Faker::Internet.email }
    password              { 'secret_passsword' }
    password_confirmation { 'secret_passsword' }
  end
end
