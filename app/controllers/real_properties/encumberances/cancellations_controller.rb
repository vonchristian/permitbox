module RealProperties
  module Encumberances
    class CancellationsController < ApplicationController
      def create
        @real_property = RealProperty.find(params[:real_property_id])
        @encumberance = RealProperties::Encumberance.find(params[:encumberance_id])
        @encumberance.cancel!
        redirect_to real_property_encumberances_url(@real_property), notice: "Encumberance cancelled successfully."
      end
    end
  end
end
