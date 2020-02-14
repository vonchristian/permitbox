require 'rails_helper'

module Locations
  describe Locality do
    describe 'associations' do
      it { is_expected.to belong_to :business_tax_computation_config }
      it { is_expected.to belong_to :capital_tax_revenue_account }
      it { is_expected.to belong_to :mayors_permit_fee_calculation_config }
      it { is_expected.to belong_to :sanitary_inspection_revenue_account }
      it { is_expected.to belong_to :police_clearance_revenue_account }
      it { is_expected.to belong_to :penalty_revenue_account }
      it { is_expected.to belong_to :surcharge_revenue_account }
      it { is_expected.to belong_to :zoning_revenue_account }
      it { is_expected.to belong_to(:province).optional }
      it { is_expected.to have_many :barangays }
      it { is_expected.to have_many :streets }
      it { is_expected.to have_many :vouchers }
      it { is_expected.to have_many :businesses }
      it { is_expected.to have_many :locality_taxpayers }
      it { is_expected.to have_many :taxpayers }
      it { is_expected.to have_many :documents }
      it { is_expected.to have_many :offices }
      it { is_expected.to have_many :charges }
      it { is_expected.to have_many :business_tax_categories }
      it { is_expected.to have_many :line_of_businesses }
      it { is_expected.to have_many :line_of_business_categories }
      it { is_expected.to have_many :ownership_types }
      it { is_expected.to have_many :tricycle_organizations }
      it { is_expected.to have_many :tricycles }
      it { is_expected.to have_many :public_markets }
      it { is_expected.to have_many :users }
      it { is_expected.to have_many :sanitary_inspection_configs }
      it { is_expected.to have_many :police_clearance_configs }
      it { is_expected.to have_many :health_certificate_configs }
      it { is_expected.to have_many :fire_safety_inspection_configs }
      it { is_expected.to have_many :zoning_fee_configs }
      it { is_expected.to have_many :annual_inspection_fee_configs }
      it { is_expected.to have_many :building_permit_fee_configs }
      it { is_expected.to have_many :documentary_stamp_tax_configs }
      it { is_expected.to have_many :electrical_installation_fee_configs }
      it { is_expected.to have_many :occupancy_permit_fee_configs }
      it { is_expected.to have_many :plumbing_installation_fee_configs }
      it { is_expected.to have_many :sealing_fee_configs }
      it { is_expected.to have_many :storage_permit_fee_configs }
      it { is_expected.to have_many :capital_tax_configs }
      it { is_expected.to have_many :tricycle_permits }
      it { is_expected.to have_many :signatories }
      it { is_expected.to have_many :discounts }
      it { is_expected.to have_many :business_surcharge_configs }
      it { is_expected.to have_many :ledger_accounts }
      it { is_expected.to have_many :accounts }
      it { is_expected.to have_many :tricycle_fees }

    end


    describe 'validations' do
      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_uniqueness_of :name }
    end
  end
end
