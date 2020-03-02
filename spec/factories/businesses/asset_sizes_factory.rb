FactoryBot.define do 
  factory :asset_size, class: Businesses::AssetSize do 
    association :business 
    association :enterprise_scale 
    asset_size { 100_000 }
  end 
end 