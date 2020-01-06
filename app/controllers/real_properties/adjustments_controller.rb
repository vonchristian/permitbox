module RealProperties
  class AdjustmentsController < ApplicationController
    def new
      @real_property = RealProperty.find(params[:real_property_id])
      @adjustment = @real_property.adjustments.build
      @adjustment_factors = Configurations::AdjustmentFactor.all
    end
    def create
      @real_property = RealProperty.find(params[:real_property_id])
      @adjustment = @real_property.adjustments.create(adjustment_params)
      if @adjustment.valid?
        @adjustment.save
        redirect_to new_real_property_adjustment_path(@real_property), notice: "Adjustment saved successfully."
      else
        render :new
      end
    end

    private
    def adjustment_params
      params.require(:real_properties_adjustment).permit(:adjustment_factor_id)
    end
  end
end
