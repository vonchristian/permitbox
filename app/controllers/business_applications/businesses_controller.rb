module BusinessApplications
  class BusinessesController < ApplicationController
    layout "signin"
    skip_before_action :authenticate_user!, ony: [:show]
    def show
      @business = Business.find(params[:id])
    end
  end
end
