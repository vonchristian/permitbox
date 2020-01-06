module Configurations
  class StoragePermitFeeConfig < ApplicationRecord
    belongs_to :revenue_account, class_name: "Accounting::Account"
    belongs_to :locality, class_name: "Locations::Locality"


    def self.find_applicable_for(business_activity)
      storage_permit_fee = all.select { |a| a.volume_range.include?(business_activity.volume) }.first
      if storage_permit_fee
        storage_permit_fee
      else
        self.order(created_at: :desc).first
      end
    end

    def volume_range
      minimum_volume..maximum_volume
    end
  end
end
