module Businesses
  class Establishment < ApplicationRecord
    include Locationable
    belongs_to :business
    belongs_to :lessor, polymorphic: true, optional: true
    has_many :tenancies, as: :tenant
    has_many :public_markets, through: :tenancies
    has_many :area_measurements, as: :measurable
    delegate :tenancy_type, :public_market_name, to: :recent_tenancies, allow_nil: true

    def self.recent
      order(created_at: :desc).first
    end

    def recent_area_measurement
      area_measurements.recent
    end
    def recent_tenancies
      tenancies.recent
    end

    def business_area
      recent_area_measurement.area || NullAreaMeasurement.new.business_area
    end

  end
end
