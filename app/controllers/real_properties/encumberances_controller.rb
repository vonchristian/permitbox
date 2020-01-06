module RealProperties
  class EncumberancesController < ApplicationController
    def index
      @real_property = RealProperty.find(params[:real_property_id])
      @encumberances = @real_property.encumberances.all
    end
    def new
      @real_property = RealProperty.find(params[:real_property_id])
      @encumberance =  @real_property.encumberances.build
    end
    def create
      @real_property = RealProperty.find(params[:real_property_id])
      @encumberance =  @real_property.encumberances.create(encumberance_params)
      if @encumberance.valid?
        @encumberance.save
        redirect_to real_property_encumberances_url(@real_property), notice: "Encumberance saved successfully."
      else
        render :new
      end
    end

    private
    def encumberance_params
      params.require(:real_properties_encumberance).
      permit(:title, :description, :effectivity_date, uploads: [])
    end
  end
end
