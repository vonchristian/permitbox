module GovModule
  module Businesses
    class BusinessPermitApplicationProcessing
      include ActiveModel::Model
      attr_accessor :applicant_id, :applicant_type, :business_id, :locality_id, :business_name, :application_date, :application_number, :ownership_type_id, :mode_of_payment,
      :complete_address, :barangay_id, :street_id, :rented, :monthly_rental, :market_vendor, :public_market_id, :tenancy_type, :business_area,
      :business_tax_category_id, :line_of_business_ids, :employee_count, :gross_sale_amount, :gross_sale_calendar_year, :taxpayer_first_name, :taxpayer_middle_name, :taxpayer_last_name
      validates :gross_sale_calendar_year, presence: true
      validates :barangay_id, presence: true
      def process!
        ActiveRecord::Base.transaction do
          create_business_permit_application
          create_line_of_businesses
          set_voucher_amounts
        end
      end

      def find_business_permit_application
        BusinessPermitApplication.find_by(application_number: application_number)
      end

      private
      def create_business_permit_application
        BusinessPermitApplication.create!(
          taxpayer_first_name:      taxpayer_first_name,
          taxpayer_middle_name:     taxpayer_middle_name,
          taxpayer_last_name:       taxpayer_last_name,
          application_date:         application_date,
          application_number:       application_number,
          applicant:                find_business,
          business_id:              business_id,
          business_name:            business_name,
          ownership_type_id:        ownership_type_id,
          mode_of_payment:          mode_of_payment,
          complete_address:         complete_address,
          barangay_id:              barangay_id,
          street_id:                street_id,
          rented:                   rented,
          monthly_rental:           monthly_rental,
          market_vendor:            market_vendor,
          public_market_id:         public_market_id,
          tenancy_type:             tenancy_type,
          business_area:            business_area,
          business_tax_category_id: business_tax_category_id,
          employee_count:           employee_count,
          gross_sale_amount:        gross_sale_amount,
          gross_sale_calendar_year: gross_sale_calendar_year
        )

      end

      def create_line_of_businesses
        LineOfBusiness.where(id: line_of_business_ids).each do |line_of_business|
          find_business_permit_application.business_activities.find_or_create_by(line_of_business:line_of_business, quantity: 1)
        end
      end

      def set_voucher_amounts
        set_default_charges
        set_business_tax
        set_mayors_permit_fees
        set_barangay_clearance_fee
        set_police_clearance_fee
        set_health_certificate_fee
        set_sanitary_inspection_fee
        set_fire_safety_inspection_fee
      end

      def set_business_tax
        find_business_tax_category.create_charge(gross_sale_amount.to_f, amountable=find_business_permit_application)
      end


      def set_mayors_permit_fees
        find_business_permit_application.line_of_businesses.each do |line_of_business|
          Vouchers::VoucherAmount.create!(
          name: "Mayors Permit Fee - #{line_of_business.name}",
          amountable: find_business_permit_application,
          amount: line_of_business.fee_amount,
          account: line_of_business.revenue_account)
        end
      end
      def set_sanitary_inspection_fee
        Vouchers::VoucherAmount.create!(
          name: "Sanitary Inspection Fee",
          amountable: find_business_permit_application,
          amount: Configurations::SanitaryInspectionConfig.set_amount_for(business_area),
          account: find_locality.sanitary_inspection_revenue_account)
      end

      def set_police_clearance_fee
        Vouchers::VoucherAmount.create!(
          name: "Police Clearance Fee",
          amountable: find_business_permit_application,
          amount: find_locality.police_clearance_configs.recent.fee_amount,
          account: find_locality.police_clearance_configs.recent.revenue_account)
      end

      def set_barangay_clearance_fee
        Vouchers::VoucherAmount.create!(
          name: "Barangay Clearance Fee (#{find_barangay.name})",
          amountable: find_business_permit_application,
          amount: find_barangay.barangay_clearance_fee,
          account: find_barangay.liability_account)
      end

      def set_health_certificate_fee
        Vouchers::VoucherAmount.create!(
          name: "Health Certificate Fee",
          amountable: find_business_permit_application,
          amount: find_locality.health_certificate_configs.recent.fee_amount,
          account: find_locality.health_certificate_configs.recent.revenue_account)
      end

      def set_fire_safety_inspection_fee
        Vouchers::VoucherAmount.create!(
          name: "Fire Safety Inspection Fee",
          amountable: find_business_permit_application,
          amount: FireSafetyInspectionConfig.recent.compute_fee(find_business_permit_application),
          account: find_locality.fire_safety_inspection_configs.recent.liability_account
        )
      end

      def find_business
        Business.find(business_id)
      end
      def find_barangay
        Locations::Barangay.find(barangay_id)
      end
      def find_locality
        Locations::Locality.find(locality_id)
      end
      def find_business_tax_category
        BusinessTaxCategory.find(business_tax_category_id)
      end

      def set_default_charges
        find_locality.charges.default.each do |charge|
          find_business_permit_application.voucher_amounts.create(
            amount: charge.amount,
            name: charge.name,
            account: charge.revenue_account)
        end
      end

    end
  end
end
