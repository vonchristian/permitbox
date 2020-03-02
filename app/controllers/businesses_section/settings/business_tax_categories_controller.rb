module BusinessesSection
  module Settings
    class BusinessTaxCategoriesController < ApplicationController
      def new
        @business_tax_category = current_locality.business_tax_categories.build
      end
      def create
        @business_tax_category = current_locality.business_tax_categories.create(business_tax_category_params)
        if @business_tax_category.save!
          @business_tax_category.save!
          redirect_to businesses_section_settings_url, notice: "Business tax category created successfully."
        else
          render :new
        end
      end

      def show
        @business_tax_category = current_locality.business_tax_categories.find(params[:id])
      end

      private
      def business_tax_category_params
        params.require(:business_tax_category).permit(:title, :description, :revenue_account_id, :discount_account_id)
      end
    end
  end
end
