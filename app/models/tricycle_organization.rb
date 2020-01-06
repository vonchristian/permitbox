class TricycleOrganization < ApplicationRecord
  belongs_to :locality, class_name: "Locations::Locality"
  has_many :tricycles
end
