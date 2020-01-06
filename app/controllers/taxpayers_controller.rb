class TaxpayersController < ApplicationController
  def index
    @taxpayers = current_locality.taxpayers
  end
  def new
    @taxpayer = Taxpayers::Registration.new
  end
  def create
    @taxpayer = Taxpayers::Registration.new(taxpayer_params)
    if @taxpayer.valid?
      @taxpayer.register!
      redirect_to taxpayer_url(@taxpayer.find_taxpayer), notice: "Taxpayer saved successfully."
    else
      render :new
    end
  end

  def show
    @taxpayer = Taxpayer.find(params[:id])
  end
  private
  def taxpayer_params
    params.require(:taxpayers_registration).
    permit(:avatar, :first_name, :middle_name, :last_name, :street_id, :barangay_id, :locality_id, :province_id)
  end
end
