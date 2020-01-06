module GovModule
  class TricyclesController < ApplicationController
    def index
      if params[:search].present?
        @pagy, @tricycles = pagy(current_locality.tricycles.text_search(params[:search]))
      else
        @pagy, @tricycles = pagy(current_locality.tricycles)
      end
    end
    def new
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
      @permit_application = GovModule::Tricycles::PermitApplication.new
    end

    def create
      @taxpayer = Taxpayer.find(params[:gov_module_tricycles_registration][:taxpayer_id])
      @permit_application = GovModule::Tricycles::PermitApplication.new(tricycle_params)
      if @permit_application.valid?
         @permit_application.process!
         redirect_to gov_module_tricycle_permit_application_url(@permit_application.find_tricycle_permit_application), notice: "Tricycle saved successfully."
       else
        render :new
      end
    end

    def show
      @tricycle = Tricycle.find(params[:id])
    end

    def edit
      @tricycle = Tricycle.find(params[:id])
    end

    def update
      @tricycle = Tricycle.find(params[:id])
      @tricycle.update(update_tricycle_params)
      if @tricycle.valid?
        @tricycle.save
        redirect_to gov_module_tricycle_url(@tricycle), notice: "Tricycle updated successfully."
      else
        render :edit
      end
    end

    def destroy
      @tricycle = Tricycle.find(params[:id])
      @tricycle.destroy
      redirect_to "/", alert: "Tricycle destroyed successfully."
    end


    private
    def tricycle_params
      params.require(:gov_module_tricycles_permit_application).
      permit(:application_date, :application_number, :mtop_number, :plate_number, :make, :model, :color,
      :tricycle_organization_id, :locality_id, :taxpayer_id,
      :complete_address, :street_id, :barangay_id, :tricycle_type)
    end
    def update_tricycle_params
      params.require(:tricycle).
      permit(:mtop_number, :plate_number, :make, :model, :color, :tricycle_organization_id)
    end
  end
end
