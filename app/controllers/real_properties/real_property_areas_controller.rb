module RealProperties
  class RealPropertyAreasController < ApplicationController
    def new
      @real_property = RealProperty.find(params[:real_property_id])
      @real_property_area = @real_property.real_property_areas.build
    end
    def create
      @real_property = RealProperty.find(params[:real_property_id])
      @real_property_area = @real_property.real_property_areas.create(real_property_area_params)
      if @real_property_area.valid?
        @real_property_area.save!
        redirect_to real_property_url(@real_property), notice: "Area saved successfully."
      else
        render :new
      end
    end

    private
    def real_property_area_params
      params.require(:real_properties_real_property_area).
      permit(:area, :effectivity_date)
    end
  end
end
