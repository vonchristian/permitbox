module GovModule
  module Tricycles
    class PermitApplicationsController < ApplicationController
      def new
        @tricycle = current_locality.tricycles.find(params[:tricycle_id])
        @permit_application = GovModule::Tricycles::PermitApplication.new
      end
      def create
        @tricycle = current_locality.tricycles.find(params[:tricycle_id])
        @permit_application = GovModule::Tricycles::PermitApplication.new(permit_params)
        if @permit_application.valid?
          @permit_application.process!
          redirect_to gov_module_tricycle_permit_application_url(tricycle_id: @tricycle.id, id: @permit_application.find_permit_application.id), notice: 'Permit application saved successfully.'
        else
          render :new
        end
      end
      def show
        @permit_application = current_locality.tricycle_permit_applications.find(params[:id])
      end

      private
      def permit_params
        params.require(:gov_module_tricycles_permit_application).
        permit(:mtop_number, :plate_number, :make, :tricycle_model, :color,
        :tricycle_organization_id, :locality_id, :tricycle_id,
        :complete_address, :street_id, :barangay_id, :tricycle_type, :account_number, :application_date, :application_number)
      end
    end
  end
end
