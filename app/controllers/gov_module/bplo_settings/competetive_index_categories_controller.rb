module GovModule
  module BploSettings
    class CompetetiveIndexCategoriesController < ApplicationController
      def new
        @competetive_index_category = CompetetiveIndexCategory.new
      end
      def create
        @competetive_index_category = CompetetiveIndexCategory.create(competetive_index_category_params)
        if @competetive_index_category.valid?
          @competetive_index_category.save
          redirect_to gov_module_bplo_settings_url, notice: 'created successfully'
        else
          render :new
        end
      end

      def edit
        @competetive_index_category = CompetetiveIndexCategory.find(params[:id])
      end

      def update
        @competetive_index_category = CompetetiveIndexCategory.find(params[:id])
        @competetive_index_category.update(competetive_index_category_params)
        if @competetive_index_category.valid?
          @competetive_index_category.save
          redirect_to gov_module_bplo_settings_url, notice: 'updated successfully'
        else
          render :edit
        end
      end

      private
      def competetive_index_category_params
        params.require(:competetive_index_category).
        permit(:name)
      end
    end
  end
end
