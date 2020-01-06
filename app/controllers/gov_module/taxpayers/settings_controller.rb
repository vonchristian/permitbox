module GovModule
  module Taxpayers
    class SettingsController < ApplicationController
      def index
        @taxpayer = current_locality.taxpayers.find(params[:taxpayer_id])
      end
    end
  end
end 
