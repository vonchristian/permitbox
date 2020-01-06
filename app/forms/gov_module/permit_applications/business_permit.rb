module GovModule
  module PermitApplications
    class BusinessPermit
      include ActiveModel::Model
      attr_accessor  :account_number, :employee_id, :applicant_id, :applicant_type, :business_id, :locality_id, :business_name, :application_date, :application_number, :ownership_type_id, :mode_of_payment, :business_permit_application_account_number,
      :complete_address, :barangay_id, :street_id, :rented, :monthly_rental, :market_vendor, :public_market_id, :tenancy_type, :business_area,
      :business_tax_category_id, :line_of_business_ids, :employee_count, :taxpayer_first_name, :taxpayer_middle_name, :taxpayer_last_name, :discount_ids
      validates :business_tax_category_id, :barangay_id, :application_date,
      :application_number, :business_name, :employee_count, :mode_of_payment,
      :ownership_type_id, :complete_address, :business_area,  presence: true
      def process!
        ActiveRecord::Base.transaction do
          create_business_permit_application
          create_line_of_businesses
          create_discounts
          set_charges
          set_discounts
        end
      end

      def find_business_permit_application
        BusinessPermitApplication.find_by(account_number: account_number)
      end
      private
      def create_business_permit_application
        BusinessPermitApplication.create!(
          account_number:           account_number,
          taxpayer_first_name:      taxpayer_first_name,
          taxpayer_middle_name:     taxpayer_middle_name,
          taxpayer_last_name:       taxpayer_last_name,
          application_date:         application_date,
          application_number:       application_number,
          business_id:              business_id,
          applicant:                find_taxpayer,
          business_name:            business_name,
          ownership_type_id:        ownership_type_id,
          mode_of_payment:          mode_of_payment,
          complete_address:         complete_address,
          barangay:                 find_barangay,
          locality_id:              locality_id,
          street_id:                street_id,
          rented:                   rented,
          monthly_rental:           monthly_rental,
          market_vendor:            market_vendor,
          public_market_id:         public_market_id,
          tenancy_type:             tenancy_type,
          business_area:            business_area,
          business_tax_category_id: business_tax_category_id,
          employee_count:           employee_count,
        )
      end

      def create_line_of_businesses
        LineOfBusiness.where(id: line_of_business_ids).each do |line_of_business|
          find_business_permit_application.business_activities.find_or_create_by!(line_of_business: line_of_business, quantity: 1)
        end
      end

      def set_charges
        BusinessChargeSetter.new(
          chargeable: find_business_permit_application,
          locality: find_locality,
          barangay: find_barangay,
          business_area: business_area.to_f,
        ).set_charges
      end
      def set_discounts
        BusinessDiscountSetter.new(
          discountable: find_business_permit_application,
        ).set_discounts
      end

      def find_locality
        Locations::Locality.find(locality_id)
      end
      def find_taxpayer
        Taxpayer.find(applicant_id)
      end
      def find_barangay
        find_locality.barangays.find(barangay_id)
      end

      def find_employee
        User.find(employee_id)
      end


      def find_business_tax_category
        BusinessTaxCategory.find(business_tax_category_id)
      end
      def create_discounts
        discount_ids.each do |discount_id|
        find_business_permit_application.discountable_discounts.find_or_create_by(
          discount_id: discount_id)
        end
      end
    end
  end
end
