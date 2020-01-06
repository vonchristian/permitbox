class Budget < ApplicationRecord
  audited
  belongs_to :account, class_name: "Accounting::Account"
  belongs_to :locality, class_name: "Locations::Locality"
end
