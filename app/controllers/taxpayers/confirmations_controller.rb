module Taxpayers
  class ConfirmationsController < ApplicationController
    layout 'signin'
    skip_before_action :authenticate_user!, only: [:new, :show]
    def new
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
    end
    def show
    end
  end
end
