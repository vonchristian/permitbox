class OwnershipType < ApplicationRecord
  has_one_attached :avatar
  belongs_to :locality, class_name: "Locations::Locality"
  has_many :businesses, dependent: :nullify
  has_many :carts, dependent: :nullify
  belongs_to :agency, optional: true
  validates :title, presence: true, uniqueness: { scope: :locality_id }
end
