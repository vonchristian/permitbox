module GovModule
  module Businesses
    class PermitsController < ApplicationController
      def index
        @business = Business.find(params[:business_id])
        @business_permits = @business.business_permits.order(approval_date: :desc)
      end
      def new
        @business = Business.find(params[:business_id])
        @permit = GovModule::Permits::BusinessPermitProcessing.new
      end

      def create
        @business = Business.find(params[:business_id])
        @permit = @business.GovModule::Permits::BusinessPermitProcessing(permit_params)
        if @permit.save!
          @permit.save
          redirect_to gov_module_business_permits_url(@business), notice: "Permit saved successfully."
        else
          render :new
        end
      end

      def show
        @business = Business.find(params[:business_id])
        @permit = Permits::BusinessPermit.find(params[:id])
        respond_to do |format|
          format.html
          format.pdf do
            pdf = @permit.template_processore.new(business: @business, permit: @permit, view_context: view_context)
            send_data pdf.render, type: "application/pdf", disposition: 'inline', file_name: "Business Permit.pdf"
          end
        end
      end

      private
      def permit_params
        params.require(:gov_module_permits_business_permit_processing).
        permit(:permit_number, :approval_date, :expiry_date, :locality_id, :signatory_id)
      end
    end
  end
end
