require 'rails_helper'

describe BusinessTaxReceivable do
  it { is_expected.to belong_to(:business).optional }
  it { is_expected.to belong_to(:business_permit_application).optional }
  it { is_expected.to belong_to :employee }
end
