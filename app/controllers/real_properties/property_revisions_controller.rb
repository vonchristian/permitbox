module RealProperties
  class PropertyRevisionsController < ApplicationController
    def new
      @real_property = RealProperty.find(params[:real_property_id])
      @property_revision = @real_property.property_revisions.build
      @general_revisions = Configurations::GeneralRevision.all
    end
    def create
      @real_property = RealProperty.find(params[:real_property_id])
      @property_revision = @real_property.property_revisions.create(property_revision_params)
      if @property_revision.valid?
        @property_revision.save!
        redirect_to real_property_url(@real_property), notice: "Real property revision saved successfully."
      else
        render :new
      end
    end

    private
    def property_revision_params
      params.require(:real_properties_property_revision).
      permit(:general_revision_id)
    end
  end
end
