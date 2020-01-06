module TaxpayerAccounts
  class RegistrationsController < ApplicationController
    layout 'landing'
    skip_before_action :authenticate_user!, only: [:new, :create]
    def new
      @taxpayer_account = Taxpayers::AccountRegistration.new
    end
    def create
      @taxpayer_account = Taxpayers::AccountRegistration.new(registration_params)
      if @taxpayer_account.valid?
        @taxpayer_account.register!
        redirect_to new_taxpayer_account_session_url, notice: "Account successfully created."
      else
        render :new
      end
    end

    private
    def registration_params
      params.require(:taxpayers_account_registration).
      permit(:first_name, :middle_name, :last_name, :email, :password, :password_confirmation, :account_number)
    end
  end
end
