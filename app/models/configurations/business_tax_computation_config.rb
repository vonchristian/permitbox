module Configurations
  class BusinessTaxComputationConfig < ApplicationRecord
    enum computation_type: [:based_on_gross_sales, :based_on_asset_size]
  end
end
