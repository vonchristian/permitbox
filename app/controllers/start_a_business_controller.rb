class StartABusinessController < ApplicationController
  layout "signin"
  skip_before_action :authenticate_user!, ony: [:new, :create]
  def new
    @business = Businesses::Registration.new
  end
  def create
    @business = Businesses::Registration.new(business_params)
    if @business.valid?
      @business.register!
      redirect_to business_applications_business_url(id: Business.find_by(account_number: params[:businesses_registration][:account_number])), notice: "Business created successfully"
    else
      render :new
    end
  end

  private
  def business_params
    params.require(:businesses_registration).
    permit(:account_number, :taxpayer_id, :business_name, :business_area, :ownership_type_id,
        :capital, :date, :business_tax_category_id,
        :street_id, :barangay_id, :locality_id, :province_id, :business_asset_size,
        line_of_business_ids: [])
  end
end
