module Configurations
  class ZoningFeeConfig < ApplicationRecord
    belongs_to :locality, class_name: "Locations::Locality"

    validates :fee_amount, presence: true, numericality: true
    def self.recent
      order(created_at: :desc).first
    end
  end
end
