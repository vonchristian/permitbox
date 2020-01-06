module RealProperties
  class SubClassificationsController < ApplicationController
    def new
      @real_property = RealProperty.find(params[:real_property_id])
      @sub_classification = @real_property.real_property_sub_classifications.build
      @sub_classifications = Configurations::SubClassification.all
    end
    def create
      @real_property = RealProperty.find(params[:real_property_id])
      @sub_classification = @real_property.real_property_sub_classifications.create(sub_classification_params)
      if @sub_classification.valid?
        @sub_classification.save!
        redirect_to real_property_settings_url(@real_property), notice: "Sub Classification updated successfully"
      else
        render :new
      end
    end

    private
    def sub_classification_params
      params.require(:real_properties_real_property_sub_classification).
      permit(:sub_classification_id)
    end
  end
end
