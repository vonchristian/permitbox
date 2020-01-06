module GovModule
  module Reports
    class CompetetiveIndexCategoriesController < ApplicationController
      def show
        @competetive_index_category = CompetetiveIndexCategory.find(params[:id])
        @businesses = @competetive_index_category.businesses
        respond_to do |format|
          format.xlsx
        end
      end
    end
  end
end 
