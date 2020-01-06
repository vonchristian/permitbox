module GovModule
  module Tricycles
    class AssessmentsController < ApplicationController
      def index
        @tricycle = current_locality.tricycles.find(params[:tricycle_id])
        @vouchers = @tricycle.all_vouchers
      end 

      def new
        @tricycle = current_locality.tricycles.find(params[:tricycle_id])
        @assessment = GovModule::Tricycles::Assessment.new
      end

      def create
        @business = current_locality.tricycles.find(params[:tricycle_id])
        @assessment = GovModule::Tricycles::Assessment.new(assessment_params)
        if @assessment.valid?
          @assessment.process!
          redirect_to gov_module_voucher_url(@assessment.find_voucher), notice: "Assessment saved successfully."
        else
          render :new
        end
      end

      private
      def assessment_params
        params.require(:gov_module_tricycles_assessment).
        permit(:tricycle_id, :date, :employee_id, :account_number, :description)
      end
    end
  end
end
