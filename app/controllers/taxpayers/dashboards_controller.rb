module Taxpayers
  class DashboardsController < ApplicationController
    before_action :authenticate_taxpayer!
    layout 'taxpayers'
    def index
      @taxpayer = current_taxpayer
    end
  end
end
