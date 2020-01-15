module FireSafetyInspectionConfigs 
  class AccountsController < ApplicationController
    def new 
      @fire_safety_inspection_config = current_locality.fire_safety_inspection_configs.find(params[:fire_safety_inspection_config_id])
      @account = @fire_safety_inspection_config.fire_safety_inspection_accounts.build 
      if params[:search].present?
        @pagy, @accounts = pagy(current_locality.accounts.revenues.text_search(params[:search]))
      else 
        @pagy, @accounts = pagy(current_locality.accounts.revenues)
      end 
    end 

    def create
      @fire_safety_inspection_config = current_locality.fire_safety_inspection_configs.find(params[:fire_safety_inspection_config_id])
      @account = @fire_safety_inspection_config.fire_safety_inspection_accounts.create(account_params)
      
      if @account.valid?
        @account.save!
        redirect_to new_fire_safety_inspection_config_account_path(@fire_safety_inspection_config), notice: 'Added successfully'
      else 
        render :new 
      end 
    end 
    def destroy
      @fire_safety_inspection_config = current_locality.fire_safety_inspection_configs.find(params[:fire_safety_inspection_config_id])
      @account = @fire_safety_inspection_config.fire_safety_inspection_accounts.find_by(account_id: params[:id]).destroy 
      redirect_to new_fire_safety_inspection_config_account_path(@fire_safety_inspection_config), alert: 'Removed successfully'
    end

    private 
    def account_params
      params.require(:fire_safety_inspection_account).
      permit(:account_id)
    end 
  end 
end 