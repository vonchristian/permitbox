module RealProperties
  class Valuation < ApplicationRecord
    belongs_to :valuable, polymorphic: true
  end
end
