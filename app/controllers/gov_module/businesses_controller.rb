module GovModule
  class BusinessesController < ApplicationController
    def index
      if params[:search].present?
        @pagy, @businesses = pagy(current_locality.businesses.text_search(params[:search]))
      else
        @pagy, @businesses = pagy(current_locality.businesses)
      end
    end
    def new
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
      @business = GovModule::Businesses::Registration.new
    end
    def create
      @taxpayer = Taxpayer.find(params[:gov_module_businesses_registration][:taxpayer_id])
      @business = GovModule::Businesses::Registration.new(registration_params)
      if @business.valid?
        @business.register!
        redirect_to gov_module_business_path(@business.find_business), notice: "Business saved successfully."
      else
        render :new
      end
    end

    def show
      @business = Business.find(params[:id])
      @mode_of_payment = GovModule::Businesses::ModeOfPayment.new
    end
    def edit
      @business = Business.find(params[:id])
    end

    def update
      @business = Business.find(params[:id])
      @business.update(update_business_params)
      if @business.valid?
        @business.save
        redirect_to gov_module_business_url(@business), notice: "Business saved successfully."
      else
        render :edit
      end
    end

    def destroy
      @business = Business.find(params[:id])
      @business.destroy
      redirect_to gov_module_businesses_url, notice: 'deleted successfully'
    end

    private
    def registration_params
      params.require(:gov_module_businesses_registration).
      permit(:locality_id, :taxpayer_id, :business_name, :business_area, :ownership_type_id,
      :account_number,
      :capital, :date, :business_tax_category_id,
      :street_id, :barangay_id, :complete_address, :locality_id, :province_id, :business_asset_size,
      line_of_business_ids: [])
    end
    def update_business_params
      params.require(:business).
      permit(:name)
    end
  end
end
