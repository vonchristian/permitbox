module RealProperties
  class ArpRequestsController < ApplicationController
    def new
      @real_property = RealProperty.find(params[:real_property_id])
      @arp_request = @real_property.arps.build
    end
    def create
      @real_property = RealProperty.find(params[:real_property_id])
      @arp_request = @real_property.arps.create(arp_params)
      if @arp_request.valid?
        @arp_request.save
        redirect_to real_property_url(@real_property), notice: "ARP requested sent successfully."
      else
        render :new
      end
    end

    private
    def arp_params
      params.require(:arp).permit(:number)
    end
  end
end
