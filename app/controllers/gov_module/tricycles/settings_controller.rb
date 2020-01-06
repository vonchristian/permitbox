module GovModule
  module Tricycles
    class SettingsController < ApplicationController
      def index
        @tricycle = Tricycle.find(params[:tricycle_id])
      end
    end
  end
end 
