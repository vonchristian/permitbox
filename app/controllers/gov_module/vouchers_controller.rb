module GovModule
  class VouchersController < ApplicationController
    def show
      @voucher = Voucher.find(params[:id])
      respond_to do |format|
        format.html
        format.pdf do
          pdf = ::VoucherPdf.new(voucher: @voucher, view_context: view_context)
          send_data pdf.render, type: "application/pdf", disposition: 'inline', file_name: "Business Permit.pdf"
        end
      end
    end
    def destroy
      @voucher = Voucher.find(params[:id])
      if @voucher.entry.blank?
        @voucher.destroy
        redirect_to "/", notice: "Assessment cancelled successfully."
      else
        redirect_to '/', alert: "Cannot cancel voucher. Already paid."
        
      end
    end
  end
end
