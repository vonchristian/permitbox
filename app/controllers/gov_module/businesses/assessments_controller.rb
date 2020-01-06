module GovModule
  module Businesses
    class AssessmentsController < ApplicationController
      def index
        @business = Business.find(params[:business_id])
        @assessments = @business.vouchers
      end
      def new
        @business = Business.find(params[:business_id])
        @assessment = GovModule::Businesses::Assessment.new
      end
      def create
        @business = Business.find(params[:business_id])
        @assessment = GovModule::Businesses::Assessment.new(assessment_params)
        if @assessment.valid?
          @assessment.process!
          redirect_to gov_module_voucher_url(@assessment.find_voucher), notice: "Assessment saved successfully."
        else
          render :new
        end
      end

      private
      def assessment_params
        params.require(:gov_module_businesses_assessment).
        permit(:business_id, :date, :employee_id, :account_number)
      end
    end
  end
end
