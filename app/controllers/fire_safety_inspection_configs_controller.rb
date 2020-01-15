class FireSafetyInspectionConfigsController < ApplicationController
  def index 
    @fire_safety_inspection_configs = current_locality.fire_safety_inspection_configs
  end 
end 