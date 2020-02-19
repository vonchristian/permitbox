FactoryBot.define do
  factory :user do
    association :locality
    email                 { Faker::Internet.email }
    password              { 'secret_passsword' }
    password_confirmation { 'secret_passsword' }

    factory :bplo_officer, class: User do 
      role { 'bplo_officer' }
    end 
  end
end
