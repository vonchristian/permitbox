class LocalitiesController < ApplicationController


  def index
    @localities = Locations::Locality.all
  end
  def edit
    @locality = Locations::Locality.find(params[:id])
  end
  def update
    @locality = Locations::Locality.find(params[:id])
    @locality.update(locality_params)
    if @locality.valid?
      @locality.save
      redirect_to gov_module_bplo_settings_url, notice: "updated"
    else
      render :edit
    end
  end

  private
  def locality_params
    params.require(:locations_locality).
    permit(:logo, :surcharge_revenue_account_id, :penalty_revenue_account_id, :capital_tax_revenue_account_id,
    :sanitary_inspection_revenue_account_id, :police_clearance_revenue_account_id, :business_tax_computation_config_id, :mayors_permit_fee_calculation_config_id)

  end
end
