module GovModule
  module PermitApplications
    class BusinessPermitApplicationsController < ApplicationController
      before_action :set_business, only: [:new, :create]

      def index
        if params[:search].present?
          @pagy, @business_permit_applications = pagy(current_locality.business_permit_applications.where.not(business_id: nil).text_search(params[:search]))
        else
          @pagy, @business_permit_applications = pagy(current_locality.business_permit_applications.where.not(business_id: nil))
        end
      end

      def new
        @applicant = current_locality.taxpayers.find_by(id: params[:applicant_id])
        @business_permit_application = GovModule::Businesses::BusinessPermitApplication.new
        authorize @business_permit_application, policy_class: BusinessPermitApplicationPolicy
      end
      def create
        @applicant = current_locality.taxpayers.find_by(id: params[:gov_module_businesses_business_permit_application][:applicant_id])
        @business_permit_application = GovModule::Businesses::BusinessPermitApplication.new(application_params)
        authorize @business_permit_application, policy_class: BusinessPermitApplicationPolicy

        if @business_permit_application.valid?
          @business_permit_application.process!
          redirect_to gov_module_permit_applications_business_permit_application_url(@business_permit_application.find_business_permit_application), notice: "Application saved successfully"
        else
          render :new
        end
      end

      def show
        @business_permit_application = current_locality.business_permit_applications.find(params[:id])
        @business = @business_permit_application.business
        respond_to do |format|
          format.html
          format.pdf do
            pdf = GovModule::PermitApplications::BusinessPermitApplicationPdf.new(business_permit_application: @business_permit_application, view_context: view_context)
            send_data pdf.render, type: "application/pdf", disposition: 'inline', file_name: "Business Permit Application.pdf"
          end
        end
      end

      def edit
        @business_permit_application = current_locality.business_permit_applications.find(params[:id])
      end

      def update
        @business_permit_application = current_locality.business_permit_applications.find(params[:id])
        @business_permit_application.update(update_business_permit_application_params)
        if @business_permit_application.valid?
          @business_permit_application.save
          redirect_to gov_module_permit_applications_business_permit_application_url(@business_permit_application), notice: "Business Permit Application updated successfully."
        else
          render :new
        end
      end

      def destroy
        @business_permit_application = BusinessPermitApplication.find(params[:id])
        @business_permit_application.destroy
        redirect_to gov_module_permit_applications_business_permit_applications_url, notice: 'Business Permit application cancelled successfully.'
      end

      private
      def set_business
        if params[:business_id].present?
          @business = current_locality.businesses.find_by(id: params[:business_id])
        else
          @business = NullBusiness.new
        end
      end
      def application_params
        params.require(:gov_module_businesses_business_permit_application).
        permit(:cart_id, :account_number, :employee_id, :applicant_id, :applicant_type, :business_id, :locality_id, :business_name, :application_date, :application_number, :ownership_type_id, :mode_of_payment, :business_permit_application_account_number,
        :complete_address, :barangay_id, :street_id, :rented, :monthly_rental, :market_vendor, :public_market_id, :tenancy_type, :business_area,
        :business_tax_category_id,  :employee_count, :discount_ids => [], :line_of_business_ids => [])
      end
      def update_business_permit_application_params
        params.require(:business_permit_application).
        permit(:business_name, :application_date, :application_number, :ownership_type_id, :mode_of_payment,
        :complete_address, :barangay_id, :street_id, :rented, :monthly_rental, :market_vendor, :public_market_id, :tenancy_type, :business_area,
        :business_tax_category_id,  :employee_count)
      end
    end
  end
end
