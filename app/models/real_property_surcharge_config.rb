class RealPropertySurchargeConfig < ApplicationRecord
  belongs_to :locality
  belongs_to :general_revision
end
