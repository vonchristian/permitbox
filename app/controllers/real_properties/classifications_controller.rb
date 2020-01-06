module RealProperties
  class ClassificationsController < ApplicationController
    def new
      @real_property = RealProperty.find(params[:real_property_id])
      @classification = @real_property.real_property_classifications.build
      @classifications = Configurations::Classification.all
    end
    def create
      @real_property = RealProperty.find(params[:real_property_id])
      @classification = @real_property.real_property_classifications.create(classification_params)
      if @classification.valid?
        @classification.save!
        redirect_to real_property_settings_url(@real_property), notice: "Classification updated successfully"
      else
        render :new
      end
    end


    private
    def classification_params
      params.require(:real_properties_real_property_classification).
      permit(:classification_id)
    end
  end
end
