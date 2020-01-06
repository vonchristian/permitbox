module Taxpayers
  class LandsController < ApplicationController
    def new
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
      @land = RealProperties::LandProcessing.new
    end
    def create
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
      @land = RealProperties::LandProcessing.new(land_params)
      if @land.valid?
        @land.save
        redirect_to taxpayer_url(@taxpayer), notice: "ss"
      else
        render :new
      end
    end

    private
    def land_params
      params.require(:real_properties_land_processing).
      permit(:street, :barangay, :locality, :province,
    :east_boundary, :west_boundary, :north_boundary, :south_boundary,
    :taxable,
    :block_number, :survey_number, :oct_number, :lot_number,
    :area, :classification, :market_value, :assessment_level,
    :administrator, :administrator_address, :taxpayer_id, uploads: [])
    end
  end
end
