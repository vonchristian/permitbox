module GovModule
  module BploSettings 
    class TricycleFeesController < ApplicationController
   
      def index 
        @pagy, @tricycle_fees = pagy(current_locality.tricycle_fees)
      end 

      def new 
        @tricycle_fee = current_locality.tricycle_fees.build 
      end 

      def create 
        @tricycle_fee = current_locality.tricycle_fees.create(fee_params)
        if @tricycle_fee.valid? 
          @tricycle_fee.save!
          redirect_to gov_module_bplo_settings_tricycle_fee_url(@tricycle_fee), notice: 'Tricycle Fee added successfully.'
        else 
          render :new 
        end 
      end 

      def show 
        @tricycle_fee = current_locality.tricycle_fees.find(params[:id])
      end 

      private 

      def fee_params
        params.require(:tricycles_tricycle_fee).
        permit(:name, :amount, :charge_scope)
      end 
    end 
  end 
end 