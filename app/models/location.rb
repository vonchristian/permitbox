class Location < ApplicationRecord
  belongs_to :locationable, polymorphic: true
  belongs_to :street, class_name: "Locations::Street", optional: true
  belongs_to :barangay, class_name: "Locations::Barangay"
  belongs_to :locality, class_name: "Locations::Locality"
  belongs_to :province, class_name: "Locations::Province", optional: true

  delegate :name, to: :street, prefix: true, allow_nil: true
  delegate :name, to: :barangay, prefix: true
  delegate :name, to: :locality, prefix: true
  delegate :name, to: :province, prefix: true

  def self.current
    order(created_at: :desc).first
  end
end
