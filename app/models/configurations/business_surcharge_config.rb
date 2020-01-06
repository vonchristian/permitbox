module Configurations
  class BusinessSurchargeConfig < ApplicationRecord
    belongs_to :locality, class_name: "Locations::Locality"
    validates :rate, presence: true, numericality: true
    validates :effectivity_date, presence: true

    def self.current
      order(effectivity_date: :desc).first
    end

    def self.compute(amount)
      current.compute(amount)
    end

    def compute(amount)
      rate * amount
    end
  end
end
