module Businesses
class Employment < ApplicationRecord
  belongs_to :business
  belongs_to :employee, class_name: "Taxpayer", foreign_key: "employee_id"
end
end 