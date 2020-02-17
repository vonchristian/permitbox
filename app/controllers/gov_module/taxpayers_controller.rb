module GovModule
  class TaxpayersController < ApplicationController
    def index
      if params[:search].present?
        @pagy, @taxpayers = pagy(current_locality.taxpayers.text_search(params[:search]))
      else
        @pagy, @taxpayers = pagy(current_locality.taxpayers.order(last_name: :asc), items: 25)
      end
    end
    def new
      @taxpayer = ::Taxpayers::Registration.new
    end
    def create
      @taxpayer = ::Taxpayers::Registration.new(registration_params)
      if @taxpayer.valid?
        @taxpayer.register!
        redirect_to gov_module_taxpayer_url(@taxpayer.find_taxpayer), notice: "Taxpayer created successfully."
      else
        render :new
      end
    end

    def show
      @taxpayer = Taxpayer.find(params[:id])
    end

    def edit
      @taxpayer = Taxpayer.find(params[:id])
    end

    def update
      @taxpayer = Taxpayer.find(params[:id])
      @taxpayer.update(update_taxpayer_params)
      if @taxpayer.valid?
        @taxpayer.save
        redirect_to gov_module_taxpayer_url(@taxpayer), notice: "Taxpayer updated successfully."
      else
        render :edit
      end
    end
    def destroy
      @taxpayer = Taxpayer.find(params[:id])
      @taxpayer.destroy
      redirect_to gov_module_taxpayers_url, notice: "Taxpayer deleted successfully"
    end

    private
    def registration_params
      params.require(:taxpayers_registration).
      permit(:first_name, :middle_name, :last_name, :sex, :email, :contact_number, :tin_number, :avatar, :locality_id, :account_number)
    end
    def update_taxpayer_params
      params.require(:taxpayer).
      permit(:first_name, :middle_name, :last_name, :sex)
    end
  end
end
