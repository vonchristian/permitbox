class Signatory < ApplicationRecord
  belongs_to :locality, class_name: "Locations::Locality"
  has_many :permit_signatories
  has_many :approved_permits, through: :permit_signatories, source: :permit

  validates :full_name, :designation, presence: true
  validates :full_name, uniqueness: { scope: :locality_id }
  
  def self.recent
    order(created_at: :desc).first
  end
end
