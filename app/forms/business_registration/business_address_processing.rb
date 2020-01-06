module BusinessRegistration
  class BusinessAddressProcessing
    include ActiveModel::Model
    attr_accessor :barangay_id, :street_number, :area, :taxpayer_id, :street_id, :locality_id, :province_id, :cart_id, :complete_address
    validates :barangay_id, presence: true
    def process!
      ActiveRecord::Base.transaction do
        create_location
      end
    end

    def create_location
      Location.create!(
        locationable: find_cart,
        complete_address: complete_address,
        street_number: street_number,
        street_id: street_id,
        barangay_id: barangay_id,
        locality_id: locality_id,
        province_id: province_id)
    end
    def create_area_measurement
      area_measurement = AreaMeasurement.create!(
        measurable: find_cart,
        area: business_area)
      set_sanitary_inspection_fee(business_area)
    end

    def set_sanitary_inspection_fee(area)
      charge = Configurations::SanitaryInspectionConfig.set_charge_for(area)
      Vouchers::VoucherAmount.create!(
        name: "Sanitary Inspection Fee",
        amountable: find_cart,
        amount: charge.amount,
        account: charge.revenue_account)
    end
    def find_cart
      Cart.find(cart_id)
    end
  end
end
