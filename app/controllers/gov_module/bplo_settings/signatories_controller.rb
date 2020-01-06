module GovModule
  module BploSettings
    class SignatoriesController < ApplicationController
      def new
        @signatory = current_locality.signatories.build
      end
      def create
        @signatory = current_locality.signatories.create(signatory_params)
        if @signatory.valid?
          @signatory.save
          redirect_to businesses_section_settings_url, notice: 'Signatory created successfully'
        else
          render :new
        end
      end

      private
      def signatory_params
        params.require(:signatory).
        permit(:full_name, :designation)
      end
    end
  end
end 
