class Charge < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :text_search, against: [:name]
  enum charge_scope: [:for_business, :for_tricycle, :applicable_to_all]
  
  belongs_to :locality, class_name: "Locations::Locality"
  has_many :business_charges, class_name: 'Businesses::BusinessCharge'
  validates :name, :locality_id, :amount, presence: true
  validates :amount, numericality: true
  
  def self.active_business_charges
    joins(:business_charges).where('business_charges.cancelled_at' => nil)
  end 

  def self.total
    sum(&:amount)
  end

  def self.default
    where(default_charge: true)
  end
  def self.for_businesses  
    for_business + applicable_to_all
  end
  def self.for_tricycles
    for_tricycle + applicable_to_all
  end
end
