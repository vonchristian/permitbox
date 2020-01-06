module GovModule
  module BploSettings
    class ChargesController < ApplicationController
      def index
        if params[:search].present?
          @pagy, @charges = pagy(current_locality.charges.text_search(params[:search]))
        else
          @pagy, @charges = pagy(current_locality.charges)
        end
      end
      
      def new
        @charge = current_locality.charges.build
      end
      def create
        @charge = current_locality.charges.create(charge_params)
        if @charge.valid?
          @charge.save!
          redirect_to gov_module_bplo_settings_charges_url, notice: 'Charge created successfully.'
        else
          render :new
        end
      end


      def edit
        @charge = current_locality.charges.find(params[:id])
      end
      def update
        @charge = current_locality.charges.find(params[:id])
        @charge.update(charge_params)
        if @charge.valid?
          @charge.save
          redirect_to businesses_section_settings_url, notice: 'Charge updated successfully.'
        else
          render :new
        end
      end

      private
      def charge_params
        params.require(:charge).
        permit(:name, :amount, :revenue_account_id, :charge_scope, :locality_id)
      end
    end
  end
end
