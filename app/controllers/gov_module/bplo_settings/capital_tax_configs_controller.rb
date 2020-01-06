module GovModule
  module BploSettings
    class CapitalTaxConfigsController < ApplicationController
      def new
        @capital_tax_config = current_locality.capital_tax_configs.build
      end
      def create
        @capital_tax_config = current_locality.capital_tax_configs.create(capital_tax_config_params)
        if @capital_tax_config.valid?
          @capital_tax_config.save!
          redirect_to businesses_section_settings_url, notice: "Capital Tax set successfully."
        else
          render :new
        end
      end

      private
      def capital_tax_config_params
        params.require(:capital_tax_config).
        permit(:rate, :locality_id, :revenue_account_id)
      end
    end
  end
end
