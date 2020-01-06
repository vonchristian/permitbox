module GovModule
  module BploSettings
    class SurchargesController < ApplicationController
      def new
        @surcharge = current_locality.business_surcharge_configs.build
      end
      def create
        @surcharge = current_locality.business_surcharge_configs.create(surcharge_params)
        if @surcharge.valid?
          @surcharge.save
          redirect_to gov_module_bplo_settings_url, notice: 'Surcharge created successfully.'
        else
          render :new
        end
      end

      private
      def surcharge_params
        params.require(:configurations_bplo_business_surcharge_config).
        permit(:rate, :effectivity_date)
      end
    end
  end
end
