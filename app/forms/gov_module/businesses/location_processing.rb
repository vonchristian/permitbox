module GovModule
  module Businesses
    class LocationProcessing
      include ActiveModel::Model
      attr_accessor :complete_address, :business_id, :street_id, :barangay_id, :locality_id, :province_id
      def process!
        ActiveRecord::Base.transaction do
          save_location
        end
      end

      private
      def save_location
        find_business.locations.create!(
          complete_address: complete_address,
          street_id: street_id,
          barangay_id: barangay_id,
          locality_id: locality_id,
          province_id: province_id)
      end
      def find_business
        Business.find(business_id)
      end
    end
  end
end
