module GovModule
  class BploSettingsController < ApplicationController
    def index
      @business_tax_categories = current_locality.business_tax_categories
      @sanitary_inspection_configs = Configurations::SanitaryInspectionConfig.all
      @line_of_business_categories = current_locality.line_of_business_categories
      @documents = current_locality.documents
      @employees = current_locality.users
      @competetive_index_categories = CompetetiveIndexCategory.all
      authorize [:gov_module, :bplo_settings]
    end
  end
end
