FactoryBot.define do
  factory :account, class: Accounting::Account do
    name   { Faker::Company.bs }
    code   { SecureRandom.uuid }
    contra { false }
    factory :asset, class: Accounting::Asset do
    end
    factory :equity, class: Accounting::Equity do
    end
    factory :liability, class: Accounting::Liability do
    end
    factory :revenue, class: Accounting::Revenue do
    end

    factory :contra_revenue, class: Accounting::Revenue do
      contra { true }
    end
    factory :expense, class: Accounting::Expense do
    end
  end
end
