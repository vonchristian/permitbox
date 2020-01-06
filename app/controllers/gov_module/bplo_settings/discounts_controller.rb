module GovModule
  module BploSettings
    class DiscountsController < ApplicationController
      def new
        @discount = current_locality.discounts.build
      end

      def create
        @discount = current_locality.discounts.create(discount_params)
        if @discount.valid?
          @discount.save
          redirect_to businesses_section_settings_url, notice: "Discount created successfully."
        else
          render :new
        end
      end

      private
      def discount_params
        params.require(:discount).permit(:rate, :discount_type, :discount_scope, :amount, :name, :discount_account_id, :discounted_account_ids =>[])
      end
    end
  end
end
