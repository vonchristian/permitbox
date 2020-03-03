FactoryBot.define do 
  factory :gross_sale, class: Businesses::GrossSale do 
    association   :business 
    calendar_year { Date.current.year }
    amount        { 100_000 }
  end 
end 