module GovModule
  module BploSettings
    module LineOfBusinesses
      class ChargesController < ApplicationController
        def new
          @line_of_business = current_locality.line_of_businesses.find(params[:line_of_business_id])
          @charge = @line_of_business.line_of_business_charges.build
        end
        def create
          @line_of_business = current_locality.line_of_businesses.find(params[:line_of_business_id])
          @charge = @line_of_business.line_of_business_charges.create(charge_params)
          if @charge.valid?
            @charge.save!
            redirect_to gov_module_bplo_settings_line_of_business_url(@line_of_business), notice: 'Charge created successfully.'
          else
            render :new
          end
        end

        private
        def charge_params
          params.require(:line_of_businesses_line_of_business_charge).
          permit(:name, :amount, :revenue_account_id)
        end
      end
    end
  end
end
