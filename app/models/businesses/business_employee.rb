module Businesses
class BusinessEmployee < ApplicationRecord
  belongs_to :business
  belongs_to :employee
end
end 