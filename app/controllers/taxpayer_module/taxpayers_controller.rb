module TaxpayerModule
  class TaxpayersController < ApplicationController
    layout 'taxpayers'
    skip_before_action :authenticate_user!
    def show
      @taxpayer = current_taxpayer
    end
  end
end
