class LineOfBusiness < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :text_search, against: [:name]

  belongs_to :locality, class_name: "Locations::Locality"
  belongs_to :line_of_business_category
  belongs_to :competetive_index_category
  has_many :line_of_business_charges, class_name: "LineOfBusinesses::LineOfBusinessCharge"
  has_many :business_activities, class_name: "Businesses::BusinessActivity"
  has_many :businesses, through: :business_activities
  has_many :business_permits, through: :businesses
  belongs_to :cart, optional: true

  validates :name, presence: true
  delegate :revenue_account, to: :line_of_business_category
  delegate :name, to: :competetive_index_category, prefix: true, allow_nil: true
  def self.essentials
    where(essential: true)
  end

  def self.non_essentials
    where(essential: false)
  end
end
