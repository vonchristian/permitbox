class CompetetiveIndexCategory < ApplicationRecord
  has_many :line_of_businesses, dependent: :nullify
  has_many :businesses, through: :line_of_businesses
end
