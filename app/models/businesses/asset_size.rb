module Businesses
  class AssetSize < ApplicationRecord
    belongs_to :business
    belongs_to :enterprise_scale, optional: true

    def self.current
      order(date: :desc).first
    end
  end
end
