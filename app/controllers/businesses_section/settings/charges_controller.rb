module BusinessesSection
  module Settings
    class ChargesController < ApplicationController
      def new
        @charge = Charge.new
      end
      def create
        @charge = Charge.create(charge_params)
        if @charge.valid?
          @charge.save
          redirect_to businesses_section_settings_url, notice: "Charge created successfully."
        else
          render :new
        end
      end

      private
      def charge_params
        params.require(:charge).
        permit(:name, :amount, :revenue_account_id, :charge_scope, :locality_id, :default_charge)
      end
    end
  end
end
