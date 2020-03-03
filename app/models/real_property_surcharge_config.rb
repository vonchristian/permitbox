class RealPropertySurchargeConfig < ApplicationRecord
  belongs_to :locality, class_name: 'Locations::Locality'
  belongs_to :general_revision, class_name: 'Configurations::GeneralRevision'
end
