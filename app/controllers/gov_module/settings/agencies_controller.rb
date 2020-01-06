module GovModule
  module Settings
    class AgenciesController < ApplicationController
      def new
        @agency = Agency.new
      end
      def create
        @agency = Agency.create(agency_params)
        if @agency.valid?
          @agency.save
          redirect_to "/", notice: "Agency created successfully."
        else
          render :new
        end
      end

      private
      def agency_params
        params.require(:agency).permit(:title, :logo)
      end
    end
  end
end
