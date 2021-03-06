module Locations
  class Locality < ApplicationRecord
    include PgSearch::Model
    pg_search_scope :text_search, against: [:name]
    has_one_attached :logo
    enum locality_type: [:city, :municipality]
    
    belongs_to :locality_classification
    belongs_to :business_tax_computation_config,      class_name: "Configurations::BusinessTaxComputationConfig"
    belongs_to :mayors_permit_fee_calculation_config, class_name: "Configurations::MayorsPermitFeeCalculationConfig"
    belongs_to :province, optional: true
    has_many :barangays
    has_many :vouchers
    has_many :voucher_amounts, through: :vouchers
    has_many :streets, through: :barangays
    has_many :businesses
    has_many :locality_taxpayers, class_name: 'Localities::LocalityTaxpayer'
    has_many :taxpayers, through: :locality_taxpayers
    has_many :documents
    has_many :offices
    has_many :charges
    has_many :business_tax_categories
    has_many :line_of_businesses
    has_many :line_of_business_categories
    has_many :ownership_types
    has_many :tricycle_organizations
    has_many :tricycles
    has_many :public_markets
    has_many :users
    has_many :sanitary_inspection_configs,         class_name: "Configurations::SanitaryInspectionConfig"
    has_many :police_clearance_configs,            class_name: "Configurations::PoliceClearanceConfig"
    has_many :health_certificate_configs,          class_name: "Configurations::HealthCertificateConfig"
    has_many :fire_safety_inspection_configs,      class_name: "Configurations::FireSafetyInspectionConfig"
    has_many :zoning_fee_configs,                  class_name: "Configurations::ZoningFeeConfig"
    has_many :annual_inspection_fee_configs,       class_name: "Configurations::AnnualInspectionFeeConfig"
    has_many :building_permit_fee_configs,         class_name: "Configurations::BuildingPermitFeeConfig"
    has_many :documentary_stamp_tax_configs,       class_name: "Configurations::DocumentaryStampTaxConfig"
    has_many :electrical_installation_fee_configs, class_name: "Configurations::ElectricalInstallationFeeConfig"
    has_many :occupancy_permit_fee_configs,        class_name: "Configurations::OccupancyPermitFeeConfig"
    has_many :plumbing_installation_fee_configs,   class_name: "Configurations::PlumbingInstallationFeeConfig"
    has_many :sealing_fee_configs,                 class_name: "Configurations::SealingFeeConfig"
    has_many :storage_permit_fee_configs,          class_name: "Configurations::StoragePermitFeeConfig"
    has_many :business_permits,                    class_name: "Permits::BusinessPermit"
    has_many :tricycle_permits,                    class_name: "Permits::TricyclePermit"
    has_many :tricycle_permit_applications,        class_name: 'Tricycles::TricyclePermitApplication'
    has_many :business_permit_applications
    has_many :tricycle_permits,                    class_name: "Permits::TricyclePermit"
    has_many :signatories
    has_many :business_surcharge_configs,          class_name: "Configurations::BusinessSurchargeConfig"
    has_many :penalty_configs,                     class_name: "Configurations::PenaltyConfig"
    has_many :ledger_accounts, class_name: 'Accounting::LedgerAccount', as: :ledgerable
    has_many :accounts, class_name: 'Accounting::Account', through: :ledger_accounts
    has_many :tricycle_fees, class_name: 'Tricycles::TricycleFee'
    validates :name, presence: true, uniqueness: true
  end
end
