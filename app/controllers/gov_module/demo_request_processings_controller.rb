module GovModule
  class DemoRequestProcessingsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:new, :create]
    layout 'landing'
    def new
      @demo_request = GovModule::DemoRequestProcessing.new
    end
    def create
      @demo_request = GovModule::DemoRequestProcessing.new(demo_request_params)
      if @demo_request.valid?
        @demo_request.save
        redirect_to for_governments_url, notice: "Demo Request sent successfully. Please check your email for our reply."
      else
        render :new
      end
    end

    private
    def demo_request_params
      params.require(:gov_module_demo_request_processing).
      permit(:locality, :email, :message)
    end
  end
end
