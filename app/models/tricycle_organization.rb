class TricycleOrganization < ApplicationRecord
  belongs_to :locality, class_name: "Locations::Locality"
  has_many :tricycles

  validates :name, :abbreviated_name, presence: true
end
