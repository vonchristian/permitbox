FactoryBot.define do
  factory :taxpayer do
    first_name  { Faker::Name.first_name }
    middle_name { Faker::Name.last_name }
    last_name   { Faker::Name.last_name }
    
    after(:build) do |member|
      member.avatar.attach(io: File.open(Rails.root.join('spec', 'support', 'images', 'default_avatar.png')), filename: 'default_avatar.png', content_type: 'image/png')
    end
  end
end
