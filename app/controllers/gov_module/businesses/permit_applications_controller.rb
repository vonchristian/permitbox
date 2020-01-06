module GovModule
  module Businesses
    class PermitApplicationsController < ApplicationController
      def new
        @business = current_locality.businesses.find(params[:business_id])
        @permit_renewal = GovModule::Permits::Applications::BusinessPermit.new
      end

      def create
        @business = current_locality.businesses.find(params[:business_id])
        @permit_renewal = GovModule::Permits::Applications::BusinessPermit.new(renewal_params)
        if @permit_renewal.valid?
          @permit_renewal.process!
          redirect_to gov_module_business_permit_application_url(@permit_renewal.find_business_permit_application.id), notice: "Application saved successfully."
        else
          render :new
        end
      end

      private
      def renewal_params
        params.require(:gov_module_permits_applications_business_permit).
        permit(:account_number, :employee_id, :taxpayer_first_name, :taxpayer_middle_name, :taxpayer_last_name, :locality_id, :business_id, :business_name, :application_date, :application_number, :ownership_type_id, :mode_of_payment,
        :complete_address, :barangay_id, :street_id, :rented, :monthly_rental, :market_vendor, :public_market_id, :tenancy_type, :business_area,
        :business_tax_category_id,  :employee_count, :line_of_business_ids => [])
      end
    end
  end
end
