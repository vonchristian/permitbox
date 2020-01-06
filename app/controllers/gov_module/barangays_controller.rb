module GovModule
  class BarangaysController < ApplicationController
    def index
      if params[:search].present?
        @barangays = current_locality.barangays.text_search(params[:search])
      else
        @barangays = current_locality.barangays.order(:name)
      end
    end
    def show
      @barangay = current_locality.barangays.find(params[:id])
    end
  end
end
