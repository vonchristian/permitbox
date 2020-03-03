require 'rails_helper'

describe GovModule::Permits::BusinessPermitPdf do
  describe 'Given an application' do
    let(:locality)                          { create(:locality, name: "Lamut") }
    let(:collection_officer)                { create(:collection_officer, locality: locality) }
    let(:cash_account)                      { create(:asset) }
    let(:revenue)                           { create(:revenue) }
    let(:employee_cash_account)             { create(:employee_cash_account, employee: collection_officer, account: cash_account) }
    let(:business_with_business_activities) { create(:business, name: "Store Ko", locality: locality) }
    let(:entry)                             { build(:entry) }
    let(:debit_amount)                      { create(:debit_amount, entry: entry, account: cash_account, amount: 100) }
    let(:credit_amount)                     { create(:credit_amount, entry: entry, account: revenue, amount: 100) }
    let(:voucher)                           { create(:voucher, date: Date.current, entry: entry) }
    let(:debit_voucher_amount)              { create(:debit_voucher_amount, account: cash_account, amount: 100) }
    let(:credit_voucher_amount)             { create(:credit_voucher_amount, account: revenue, amount: 100) }
    let(:business_permit_application)       { create(:business_permit_application, business: business_with_business_activities, locality: locality, voucher: voucher) }
    let(:permit)                            { create(:business_permit, permit_number: '100', permitable: business_permit_application, locality: locality) }
    let(:pdf)                               { described_class.new(permit: permit, voucher: voucher, view_context: ActionView::Base.new ) }
    let(:pdf_content)                       { PDF::Reader.new(StringIO.new(pdf.render)).page(1).to_s }
   
    it { expect(pdf_content).to include('STORE KO') }

  end
end
