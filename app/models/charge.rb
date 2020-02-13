class Charge < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :text_search, against: [:name]
  enum charge_scope: [:for_business, :for_tricycle, :applicable_to_all]
  belongs_to :revenue_account, class_name: "Accounting::Account"
  belongs_to :locality, class_name: "Locations::Locality"

  validates :name, :revenue_account_id, :locality_id, :amount, presence: true
  validates :amount, numericality: true

  delegate :name, to: :revenue_account, prefix: true
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
