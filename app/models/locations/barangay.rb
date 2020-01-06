module Locations
  class Barangay < ApplicationRecord
    include PgSearch
    pg_search_scope :text_search, against: [:name]
    belongs_to :locality
    belongs_to :liability_account, class_name: "Accounting::Account", optional: true
    has_one_attached :logo
    has_many :streets
    has_many :locations
    has_many :businesses, through: :locations, source: :locationable, source_type: "Business"
    has_many :business_permits, through: :businesses
    has_many :taxpayers, through: :locations, source: :locationable, source_type: "Taxpayer"
    has_many :barangay_charges, class_name: 'Barangays::BarangayCharge'
    has_many :charges, through: :barangay_charges 
    delegate :name, to: :locality, prefix: true
    before_save :set_default_logo

    private
    def set_default_logo
      if logo.attachment.blank?
        self.logo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'business_logo_placeholder.png')), filename: 'default-image.png', content_type: 'image/png')
      end
    end
  end
end
