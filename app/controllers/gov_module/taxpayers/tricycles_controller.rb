module GovModule
  module Taxpayers
    class TricyclesController < ApplicationController
      def index
        @taxpayer = Taxpayer.find(params[:taxpayer_id])
        @tricycles = @taxpayer.tricycles.for_locality(locality: current_locality)
      end
      
      def new 
        @taxpayer = current_locality.taxpayers.find(params[:taxpayer_id])
        @tricycle = @taxpayer.tricycles.build 
      end 

      def show
        @tricycle = Tricycle.find(params[:id])
      end
    end
  end
end
