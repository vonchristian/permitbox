module Admittances
  class TaxpayersController < ApplicationController
    layout 'signin'
    skip_before_action :authenticate_user!, only: [:index]
    def new
      @taxpayer = Taxpayers::AccountSignUp.new
    end
    def create
      @taxpayer = Taxpayers::AccountSignUp.new
    end
  end
end
