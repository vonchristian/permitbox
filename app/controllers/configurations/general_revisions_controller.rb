module Configurations
  class GeneralRevisionsController < ApplicationController
    def new
      @general_revision = Configurations::GeneralRevision.new
    end
    def create
      @general_revision = Configurations::GeneralRevision.create(general_revision_params)
      if @general_revision.valid?
        @general_revision.save!
        redirect_to settings_url, notice: "General revision created successfully."
      else
        render :new
      end
    end

    private
    def general_revision_params
      params.require(:configurations_general_revision).
      permit(:title, :effectivity_year)
    end
  end
end
