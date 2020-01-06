class BusinessPenaltyConfig < ApplicationRecord
  belongs_to :locality
  belongs_to :revenue_account
end
