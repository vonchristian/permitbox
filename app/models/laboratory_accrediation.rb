class LaboratoryAccrediation < ApplicationRecord
  belongs_to :locality
  belongs_to :laboratory
end
