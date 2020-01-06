module Localities
  class LocalityTaxpayer < ApplicationRecord
    belongs_to :taxpayer
    belongs_to :locality,           class_name: 'Locations::Locality'
    belongs_to :receivable_account, class_name: 'Accounting::Account', foreign_key: 'receivable_account_id', optional: true

    # validates :receivable_account_id, uniqueness: true, allow_blank: true
  end
end
