module GovModule
  module Businesses
    class OwnershipsController < ApplicationController
      def new
        @business = Business.find(params[:business_id])
        if params[:search].present?
          @taxpayers = current_locality.taxpayers.text_search(params[:search]).paginate(page: params[:page], per_page: 25)
        else
          @taxpayers = current_locality.taxpayers.paginate(page: params[:page], per_page: 25)
        end
        @ownership = @business.ownerships.build
      end
      def create
        @business = Business.find(params[:business_id])
        @ownership = @business.ownerships.create(ownership_params)
        @ownership.save!
        redirect_to new_gov_module_business_ownership_url(@business), notice: "Taxpayer added successfully."
      end
      def destroy
        @business = Business.find(params[:business_id])
        @taxpayer = Taxpayer.find(params[:taxpayer_id])
        @ownership = @business.ownerships.where(owner: @taxpayer).first.destroy
        redirect_to gov_module_business_url(@business), notice: "Ownership removed successfully."
      end

      private
      def ownership_params
        params.require(:ownership).permit(:owner_id, :owner_type)
      end
    end
  end
end
