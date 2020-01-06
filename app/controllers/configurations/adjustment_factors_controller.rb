module Configurations
  class AdjustmentFactorsController < ApplicationController
    def new
      @adjustment_factor = Configurations::AdjustmentFactor.new
    end
    def create
      @adjustment_factor = Configurations::AdjustmentFactor.create(adjustment_factor_params)
      if @adjustment_factor.valid?
        @adjustment_factor.save
        redirect_to settings_url, notice: "Adjustment Factor created successfully."
      else
        render :new
      end
    end

    private
    def adjustment_factor_params
      params.require(:configurations_adjustment_factor).
      permit(:title, :description, :adjustment_type, :percent, :amount)
    end
  end
end
