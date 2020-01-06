module GovModule
  class MonitoringController < ApplicationController
    def index
      @documents = current_locality.documents
    end
  end
end
