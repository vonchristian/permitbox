module Taxpayers
  class BusinessLocationsController < ApplicationController
    layout 'taxpayers'
    skip_before_action :authenticate_user!, only: [:new]
    def new
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
      if params[:search].present?
        @localities = Locations::Locality.text_search(params[:text_search])
      else
        @localities = Locations::Locality.all
      end
    end
  end
end
