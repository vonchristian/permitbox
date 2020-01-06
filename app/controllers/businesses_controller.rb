class BusinessesController < ApplicationController
  def index
    if params[:search].present?
      @pagy, @businesses = pagy(current_locality.businesses.text_search(params[:search]))
    else
      @pagy, @businesses = pagy(current_locality.businesses)
      respond_to do |format|
        format.html
        format.xlsx
      end
    end
  end
  def show
    @business = Business.find(params[:id])
  end
end
