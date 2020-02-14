module Taxpayers
  class BusinessesController < ApplicationController
    layout 'taxpayers'
    skip_before_action :authenticate_user!, only: [:index, :new, :create, :show]

    before_action :authenticate_taxpayer_account!
    def index
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
      @pagy, @businesses = pagy(@taxpayer.businesses)
    end
    def new
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
      @business = Businesses::Registration.new
    end
    def create
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
      @business = Businesses::Registration.new(business_params)
      if @business.valid?
        @business.register!
        redirect_to taxpayer_businesses_url(@taxpayer), notice: "Business saved successfully."
      else
        render :new
      end
    end

    def show
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
      @business = @taxpayer.businesses.find(params[:id])
    end

    private
    def business_params
      params.require(:businesses_registration).
      permit(:taxpayer_first_name, :taxpayer_middle_name, :taxpayer_last_name, :taxpayer_id, :business_name, :business_area, :ownership_type_id,
        :capital, :date, :business_tax_category_id,
        :street_id, :barangay_id, :locality_id, :province_id, :business_asset_size,
        line_of_business_ids: [])
    end
  end
end
