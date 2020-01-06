module GovModule
  module Businesses
    class Registration
      attr_reader :business_permit_application

      def initialize(args)
        @business_permit_application = args.fetch(:business_permit_application)
      end

      def register!
        ActiveRecord::Base.transaction do
          create_business
        end
      end

      private
      def create_business
        business = Business.create!(
          business_number: Business.count.succ,
          locality_id: business_permit_application.locality_id,
          account_number: SecureRandom.uuid,
          name: business_permit_application.business_name,
          ownership_type_id: business_permit_application.ownership_type_id,
          business_tax_category_id: business_permit_application.business_tax_category_id
          )
        create_owner(business)
        create_area_measurement(business)
        create_location(business)

        create_capital(business)
        create_gross_sales(business)
        # create_asset_size(business)
        create_business_activities(business)
        set_required_documents(business)
        business_permit_application.update_attributes(business: business)
      end

      def find_taxpayer
        Taxpayer.find(business_permit_application.applicant_id)
      end

      def find_locality
        business_permit_application.locality
      end

      def create_owner(business)
        Ownership.create!(
          ownable: business,
          owner: find_taxpayer)
      end

      def create_area_measurement(business)
        area_measurement = AreaMeasurement.create!(
          measurable: business,
          area: business_permit_application.business_area)
      end

      def create_capital(business)
        if business_permit_application.capital_amount.present?
          capital = business.create_business_capital(
            capital_amount: business_permit_application.capital_amount,
            date: business_permit_application.application_date)
        end
      end

      def create_gross_sales(business)
        business_permit_application.gross_sales << business.gross_sales
      end

      def create_location(business)
        Location.create!(
          complete_address: business_permit_application.complete_address,
          locationable:     business,
          street_id:        business_permit_application.street_id,
          barangay_id:      business_permit_application.barangay_id,
          locality_id:      business_permit_application.locality_id,
          province_id:      business_permit_application.province_id)
      end

      # def create_asset_size(business)
      #   asset_size = business.asset_sizes.create!(
      #     enterprise_scale_id: EnterpriseScale.all.select{ |a| a.range.cover?(business_asset_size.to_f) }.first.try(:id),
      #     business: business,
      #     asset_size: asset_size)
      # end

      def create_business_activities(business)
        business.business_activities << business_permit_application.business_activities
      end

      def set_required_documents(business)
        find_locality.documents.each do |document|
          business.required_documents.find_or_create_by!(
            document: document)
        end
      end
    end
  end
end
