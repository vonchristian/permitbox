require 'rails_helper'

describe Business do
  describe 'associations' do
    it { is_expected.to belong_to :locality }
    it { is_expected.to belong_to :business_tax_category }
    it { is_expected.to belong_to :ownership_type }
    it { is_expected.to have_one  :business_capital }
    it { is_expected.to have_one  :business_name }
    it { is_expected.to have_many :establishments }
    it { is_expected.to have_many :ownerships }
    it { is_expected.to have_many :taxpayer_owners }
    it { is_expected.to have_many :gross_sales }
    it { is_expected.to have_many :document_transactions }
    it { is_expected.to have_many :documents }
    it { is_expected.to have_many :business_activities }
    it { is_expected.to have_many :line_of_businesses }
    it { is_expected.to have_many :amounts }
    it { is_expected.to have_many :entries }
    it { is_expected.to have_many :voucher_amounts }
    it { is_expected.to have_many :asset_sizes }
    it { is_expected.to have_many :required_documents }
    it { is_expected.to have_many :business_permits }
    it { is_expected.to have_many :employee_counts }
    it { is_expected.to have_many :business_tax_receivables }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
  end

  describe 'delegations' do
    it { is_expected.to delegate_method(:title).to(:business_tax_category).with_prefix }
    it { is_expected.to delegate_method(:enterprise_scale).to(:current_asset_size) }
    it { is_expected.to delegate_method(:title).to(:ownership_type).with_prefix }
    it { is_expected.to delegate_method(:province).to(:locality) }
    it { is_expected.to delegate_method(:details).to(:current_location).with_prefix }
    it { is_expected.to delegate_method(:complete_address).to(:current_location).with_prefix }
    it { is_expected.to delegate_method(:barangay_name).to(:current_location).with_prefix }
    it { is_expected.to delegate_method(:street_name).to(:current_location).with_prefix }
    it { is_expected.to delegate_method(:enterprise_scale).to(:current_asset_size) }
  end
   it '.closed' do
     business         = create(:business, closed_at: nil)
     closed_business = create(:business, closed_at: Date.current)

     expect(described_class.closed).to include(closed_business)
     expect(described_class.closed).to_not include(business)
   end
 
   it '.closed_on(args={})' do
     business          = create(:business, closed_at: nil)
     closed_business   = create(:business, closed_at: Date.current)
     closed_business_2 = create(:business, closed_at: Date.current.next_month)


     expect(described_class.closed_on(from_date: Date.current.beginning_of_month, to_date: Date.current)).to include(closed_business)
     expect(described_class.closed_on(from_date: Date.current.beginning_of_month, to_date: Date.current)).to_not include(closed_business_2)

     expect(described_class.closed_on(from_date: Date.current.next_month.beginning_of_month, to_date: Date.current.next_month)).to include(closed_business_2)
     expect(described_class.closed_on(from_date: Date.current.next_month.beginning_of_month, to_date: Date.current.next_month)).to_not include(closed_business)

   end
  it '#closed?' do
    business = create(:business, closed_at: nil)
    closed_business = create(:business, closed_at: Date.current)

    expect(business.closed?).to eql false
    expect(closed_business.closed?).to eql true
  end


end
