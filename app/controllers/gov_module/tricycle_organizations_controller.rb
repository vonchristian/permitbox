module GovModule
  class TricycleOrganizationsController < ApplicationController
    def index
    end
    def show
      @tricycle_organization = TricycleOrganization.find(params[:id])
    end
  end
end
