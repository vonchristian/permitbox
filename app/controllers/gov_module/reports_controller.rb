module GovModule
  class ReportsController < ApplicationController
    def index
      if params[:line_of_business_search].present?
        @line_of_businesses = current_locality.line_of_businesses.text_search(params[:line_of_business_search]).paginate(page: params[:page], per_page: 25)
      else
        @line_of_businesses = current_locality.line_of_businesses.paginate(page: params[:page], per_page: 25)
      end
      @public_markets = current_locality.public_markets 
    end
  end
end
