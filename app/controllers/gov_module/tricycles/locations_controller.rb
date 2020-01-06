module GovModule
  module Tricycles
    class LocationsController < ApplicationController
      def edit
        @tricycle = current_locality.tricycles.find(params[:tricycle_id])
        @location = Location.find(params[:id])
      end
      def update
        @tricycle = current_locality.tricycles.find(params[:tricycle_id])
        @location = Location.find(params[:id])
        @location.update(location_params)
        if @location.valid?
          @location.save
          redirect_to gov_module_tricycle_url(@tricycle), notice: 'Tricycle address updated successfully.'
        else
          render :edit
        end
      end

      private
      def location_params
        params.require(:location).
        permit(:complete_address, :street_id, :barangay_id, :locality_id, :province_id)
      end
    end
  end
end
