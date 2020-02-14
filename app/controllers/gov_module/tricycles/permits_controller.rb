module GovModule
  module Tricycles
    class PermitsController < ApplicationController
      def index
        @tricycle         = current_locality.tricycles.find(params[:tricycle_id])
        @tricycle_permits = @tricycle.tricycle_permits
      end
     
    end
  end
end
