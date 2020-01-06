module GovModule
  module PermitApplications
    module BusinessPermitApplications
      class GrossSalesController < ApplicationController

        def new
          @business_permit_application = BusinessPermitApplication.find(params[:business_permit_application_id])
          @gross_sale                  = GovModule::GrossSaleProcessing.new
        end

        def create
          @business_permit_application = BusinessPermitApplication.find(params[:business_permit_application_id])
          @gross_sale                  = GovModule::GrossSaleProcessing.new(gross_sale_params)
          if @gross_sale.valid?
            @gross_sale.process!
            redirect_to gov_module_permit_applications_business_permit_application_url(@business_permit_application), notice: "Gross sales added successfully."
          else
            render :new
          end
        end

        def destroy
          @business_permit_application = BusinessPermitApplication.find(params[:business_permit_application_id])
          @gross_sale = @business_permit_application.gross_sales.find(params[:id])
          @gross_sale.destroy
          remove_tax_receivables
          remove_amounts
          redirect_to gov_module_permit_applications_business_permit_application_url(@business_permit_application), notice: "Gross sales removed successfully."
        end

        private
        def gross_sale_params
          params.require(:gov_module_gross_sale_processing).
          permit(:calendar_year, :amount, :business_permit_application_id, :employee_id, :mode_of_payment)
        end
        
        def remove_tax_receivables
          @business_permit_application.business_tax_receivables.destroy_all
        end

        def remove_amounts
          @business_permit_application.voucher_amounts.where(
          account: @business_permit_application.business_tax_category.revenue_account).destroy_all

          @business_permit_application.voucher_amounts.where(
          account: @business_permit_application.business_tax_category.discount_account).destroy_all
        end
      end
    end
  end
end
