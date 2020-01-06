module BusinessesSection
  class SettingsController < ApplicationController
    def index
      @business_tax_categories = current_locality.business_tax_categories
      @sanitary_inspection_configs = Configurations::SanitaryInspectionConfig.all
      @line_of_business_categories = current_locality.line_of_business_categories
      @documents = current_locality.documents
      @employees = current_locality.users 
    end
  end
end
