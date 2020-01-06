module GovModule
  module BploSettings
    class LineOfBusinessesController < ApplicationController
      def index
        @line_of_businesses = current_locality.line_of_businesses.order(:name).paginate(page: params[:page], per_page: 25)
      end
      def show
        @line_of_business = current_locality.line_of_businesses.find(params[:id])
      end
    end
  end
end
