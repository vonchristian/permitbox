FactoryBot.define do 
  factory :sanitary_inspection_config, class: Configurations::SanitaryInspectionConfig do 
    minimum_area { 1 }
    maximum_area { 100 }
    association :locality 
  end 
end 