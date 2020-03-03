module Localities
  class LocalityTaxpayer < ApplicationRecord
    belongs_to :taxpayer
    belongs_to :locality,           class_name: 'Locations::Locality'

    # validates :receivable_account_id, uniqueness: true, allow_blank: true
  end
end
