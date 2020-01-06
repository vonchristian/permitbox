module GovModule
  module Agencies
    class ReportsController < ApplicationController
      def index
        @agency = Agency.find(params[:agency_id])
      end
    end
  end
end
