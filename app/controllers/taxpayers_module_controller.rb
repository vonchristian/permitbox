class TaxpayersModuleController < ApplicationController 
  skip_before_action :authenticate_user!, only: [:index]
  layout "taxpayers"
  def index 
  end 
end 