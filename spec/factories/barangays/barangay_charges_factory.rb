FactoryBot.define do
  factory :barangay_charge, class: Barangays::BarangayCharge do
    association :barangay
    association :charge
  end
end
