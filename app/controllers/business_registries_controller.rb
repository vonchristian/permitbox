class BusinessRegistriesController < ApplicationController
  def create
    @registry = Registries::BusinessRegistry.create(registry_params)
    @registry.save
    ActiveRecord::Base.transaction do
      file = params[:registries_business_registry][:spreadsheet]
      @registry.parse_for_records(file)
      redirect_to '/', notice: 'uploaded successfully.'
    end
  end

  private
  def registry_params
    params.require(:registries_business_registry).
    permit(:locality_id, :spreadsheet, :employee_id)
  end
end
