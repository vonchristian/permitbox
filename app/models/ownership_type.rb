class OwnershipType < ApplicationRecord
  has_one_attached :avatar
  belongs_to :locality, class_name: "Locations::Locality"
  belongs_to :agency, optional: true
 
  has_many :businesses, dependent: :nullify
  has_many :carts,      dependent: :nullify
  
  validates :title, presence: true, uniqueness: { scope: :locality_id }
end
