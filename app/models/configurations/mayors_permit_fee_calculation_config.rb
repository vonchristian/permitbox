module Configurations
  class MayorsPermitFeeCalculationConfig < ApplicationRecord
    enum config_type: [:based_on_enterprise_scale, :per_line_of_business, :based_on_business_tax]

    has_many :localities, class_name: 'Locations::Locality'
  end
end
