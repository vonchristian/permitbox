class RealPropertiesController < ApplicationController
  def show
    @real_property = RealProperty.find(params[:id])
  end
end
