module Tricycles
  class TricyclePermitApplication < ApplicationRecord
    include PgSearch::Model
    extend RecentApplicationFinder
    pg_search_scope :text_search, against: [:application_number, :make, :tricycle_model, :color, :plate_number],
    :associated_against => { :taxpayer => [:first_name, :middle_name, :last_name]}
    
    enum application_type: [:new_application, :renew]


    belongs_to :tricycle_organization
    belongs_to :locality, class_name: "Locations::Locality"
    belongs_to :tricycle
    belongs_to :taxpayer
    has_one    :voucher,   as: :payee
    has_many :tricycle_permits, class_name: "Permits::TricyclePermit", as: :permitable
    has_many :tricycle_charges, class_name: 'Tricycles::TricycleCharge', dependent: :nullify
    has_many :tricycle_fees, through: :tricycle_charges
    
    validates :application_date, :application_number, presence: true 
    delegate :name, to: :tricycle_organization, prefix: true
    delegate :current_location_complete_address, to: :tricycle
    delegate :full_name, to: :taxpayer, prefix: true
    delegate :penalty_revenue_account, to: :tricycle
    
    def self.vouchers
      Voucher.where(payee_id: self.pluck(:id))
    end

    def processed?
      voucher.present?
    end

    def name
      taxpayer.full_name
    end

    def taxpayers_full_name
      taxpayer.full_name
    end

    def make_and_model
      "#{make} #{tricycle_model}"
    end
  end
end 