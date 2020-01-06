module LineOfBusinesses
  class LineOfBusinessCharge < ApplicationRecord
    belongs_to :revenue_account, class_name: "Accounting::Account"
    belongs_to :line_of_business

    validates :amount, :name, presence: true
    validates :amount, numericality: true
  end
end
