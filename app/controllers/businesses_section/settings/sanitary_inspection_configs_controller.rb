module BusinessesSection
  module Settings
    class SanitaryInspectionConfigsController < ApplicationController
      def new
        @sanitary_inspection_config = BusinessesSection::Settings::SanitaryInspectionConfigProcessing.new
      end
      def create
        @sanitary_inspection_config = BusinessesSection::Settings::SanitaryInspectionConfigProcessing.new(sanitary_config_params)
        if @sanitary_inspection_config.valid?
          @sanitary_inspection_config.process!
          redirect_to businesses_section_settings_url, notice: "Sanitary Inspection Config created successfully"
        else
          render :new
        end
      end

      private
      def sanitary_config_params
        params.require(:businesses_section_settings_sanitary_inspection_config_processing).
        permit(:minimum_area, :maximum_area, :fee_amount, :revenue_account_id, :locality_id)
      end
    end
  end
end
