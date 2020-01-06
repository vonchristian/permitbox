module BusinessRegistration
  class LocationProcessing
    include ActiveModel::Model
    attr_accessor :complete_address, :street_id, :barangay_id, :locality_id, :province_id, :business_area, :cart_id,
    :market_vendor, :public_market_id, :rented, :monthly_rental, :tenancy_type,
    :lessor_name, :lessor_address, :lessor_email, :lessor_contact_number

    def process!
      ActiveRecord::Base.transaction do
        create_location
        create_area_measurement
      end
    end

    private
    def create_location
      find_cart.locations.create!(
        complete_address: complete_address,
        street_id: street_id,
        barangay_id: barangay_id,
        locality_id: locality_id,
        province_id: province_id)
      find_cart.update_attributes!(
        market_vendor: market_vendor,
        rented: rented,
        monthly_rental: monthly_rental,
        tenancy_type: tenancy_type,
        lessor_name: lessor_name,
        lessor_address: lessor_address,
        lessor_email: lessor_email,
        lessor_contact_number: lessor_contact_number)
    end
    def create_area_measurement
      area_measurement = AreaMeasurement.create!(
        measurable: find_cart,
        area: business_area)
      set_sanitary_inspection_fee(business_area)
    end

    def set_sanitary_inspection_fee(area)
      if charge_amount(area).present?
        Vouchers::VoucherAmount.create!(
          name: "Sanitary Inspection Fee",
          amountable: find_cart,
          amount: charge_amount,
          account: charge.revenue_account)
      end
    end
    def find_cart
      Cart.find_by_id(cart_id)
    end
    def charge_amount(business_area)
      Configurations::SanitaryInspectionConfig.set_amount_for(business_area)
    end
  end
end
