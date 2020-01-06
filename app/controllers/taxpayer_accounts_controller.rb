class TaxpayerAccountsController < ApplicationController
  layout 'taxpayers'
  skip_before_action :authenticate_user!, only: [:show]
  def show
    @taxpayer_account = current_taxpayer_account
  end
end
