require 'rails_helper'

RSpec.describe BusinessTaxCategory, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :revenue_account }
    it { is_expected.to belong_to :discount_account }
    it { is_expected.to belong_to :locality }
    it { is_expected.to have_many :gross_sales_tax_ranges }
    it { is_expected.to have_many :businesses }
  end
end
