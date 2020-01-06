module GovModule
  module Reports
    module PublicMarkets
      class TransientWithoutPermitsController < ApplicationController
        def index
          @public_market = current_locality.public_markets.find(params[:public_market_id])
          @from_date     = params[:from_date] ? Date.parse(params[:from_date]) : Date.current.beginning_of_year
          @to_date       = params[:to_date] ? Date.parse(params[:to_date]) : Date.current.end_of_year
          @businesses = @public_market.transient_tenants.without_permits(from_date: @from_date, to_date: @to_date)
          respond_to do |format|
            format.xlsx
          end
        end
      end
    end
  end
end
