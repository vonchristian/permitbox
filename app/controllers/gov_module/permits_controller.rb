module GovModule
  class PermitsController < ApplicationController
    def show
      @permit = Permit.find(params[:id])
    end
    def edit
      @permit = Permit.find(params[:id])
    end
    def update
      @permit = Permit.find(params[:id])
      @permit.update(permit_params)
      if @permit.valid?
        @permit.save!
        redirect_to gov_module_permit_url(@permit), notice: "Permit updated successfully."
      else
        render :edit
      end
    end
      private
      def permit_params
        if @permit.is_a?(Permits::BusinessPermit)
          params.require(:permits_business_permit).
          permit(:plate_number, :permit_type, :permit_number, :approval_date, :expiry_date)
        elsif @permit.is_a?(Permits::TricyclePermit)
          params.require(:permits_tricycle_permit).
          permit(:plate_number, :permit_type, :permit_number, :approval_date, :expiry_date)
        end
      end
    end
  end
