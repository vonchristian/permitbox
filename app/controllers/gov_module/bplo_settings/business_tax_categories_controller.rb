module GovModule
  module BploSettings
    class BusinessTaxCategoriesController < ApplicationController
      def index
      end
      def new
        @category = current_locality.business_tax_categories.build
      end
      def create
        @category = current_locality.business_tax_categories.create(category_params)
        if @category.valid?
          @category.save!
          redirect_to gov_module_bplo_settings_business_tax_categories_url, notice: 'Category created successfully.'
        else
          render :new
        end
      end

      private
      def category_params
        params.require(:business_tax_category).
        permit(:title, :description, :revenue_account_id, :discount_account_id)
      end
    end
  end
end
