class Office < ApplicationRecord
  has_many :documents, as: :issuing_office
  belongs_to :locality, class_name: "Locations::Locality"
  validates :name, presence: true
end
