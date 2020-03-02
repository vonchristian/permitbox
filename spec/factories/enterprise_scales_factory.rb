FactoryBot.define do 
  factory :enterprise_scale do 
    min_asset_size { 10_000 }
    max_asset_size { 100_000 }
    association :locality
  end 
end 