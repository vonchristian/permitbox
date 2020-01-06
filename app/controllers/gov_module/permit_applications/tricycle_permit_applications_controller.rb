module GovModule
  module PermitApplications
    class TricyclePermitApplicationsController < ApplicationController
      before_action :set_tricycle, only: [:new, :create, :edit, :update]

      def index
        if params[:search].present?
          @tricycle_permit_applications = current_locality.tricycle_permit_applications.text_search(params[:search]).paginate(page: params[:page], per_page: 25)
        else
          @tricycle_permit_applications = current_locality.tricycle_permit_applications.paginate(page: params[:page], per_page: 25)
        end
      end

      def new
        @taxpayer = current_locality.taxpayers.find(params[:taxpayer_id])
        @tricycle_permit_application = ::Tricycles::PermitApplication.new
      end
      def create
        @taxpayer = current_locality.taxpayers.find(params[:tricycles_permit_application][:taxpayer_id])
        @tricycle_permit_application = ::Tricycles::PermitApplication.new(application_params)
        if @tricycle_permit_application.valid?
          @tricycle_permit_application.process!
          redirect_to gov_module_permit_applications_tricycle_permit_application_url(@tricycle_permit_application.find_permit_application), notice: 'Application created successfully'
        else
          render :new
        end
      end

      def show
        @tricycle_permit_application= ::PermitApplications::TricyclePermitApplication.find(params[:id])
        @tricycle = @tricycle_permit_application.tricycle
      end

      def edit
        @tricycle_permit_application = current_locality.tricycle_permit_applications.find(params[:id])
        @taxpayer = @tricycle_permit_application.taxpayer
      end

      def update
        @tricycle_permit_application = current_locality.tricycle_permit_applications.find(params[:id])
        @taxpayer = @tricycle_permit_application.taxpayer
        @tricycle_permit_application.update(update_tricycle_permit_application_params)
        if @tricycle_permit_application.valid?
          @tricycle_permit_application.save
          redirect_to gov_module_permit_applications_tricycle_permit_application_url(@tricycle_permit_application), notice: 'Tricycle Permit Application updated successfully.'
        else
          render :edit
        end
      end
      def destroy
        @tricycle_permit_application = current_locality.tricycle_permit_applications.find(params[:id])
        @tricycle_permit_application.destroy
        redirect_to gov_module_taxpayers_url, notice: "Application deleted successfully."
      end

      private
      def application_params
        params.require(:tricycles_permit_application).
        permit(:application_date,
               :application_number,
               :mtop_number,
               :plate_number,
               :make,
               :tricycle_model,
               :color,
               :tricycle_organization_id,
               :locality_id,
               :taxpayer_id,
               :application_type,
               :account_number,
               :employee_id,
              :cart_id)
      end

      def update_tricycle_permit_application_params
        params.require(:tricycle_permit_application).
        permit(:mtop_number, :application_date, :application_number, :plate_number,
        :tricycle_organization_id, :barangay_id, :make, :tricycle_model, :tricycle_type, :color, :cart_id)
      end

      def set_tricycle
        if params[:tricycle_id].present?
          @tricycle = current_locality.tricycles.find(params[:tricycle_id])
        else
          @tricycle = NullTricycle.new
        end
      end
    end
  end
end
