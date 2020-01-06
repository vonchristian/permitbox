require 'rails_helper'

describe GovModule::Permits::BusinessPermitPdf do
  describe 'Given an application' do
    let(:locality) { create(:locality, name: "Lamut") }
    let(:business_with_business_activities) { create(:business, name: "Store Ko", locality: locality) }
    let(:business_permit_application) { create(:business_permit_application, business: business_with_business_activities, locality: locality) }
    let(:voucher) { create(:voucher, payee: business_permit_application, date: Date.current) }
    let(:entry)   { create(:entry_with_credit_and_debit, commercial_document: voucher) }
    let(:permit) { create(:business_permit, permit_number: '100', permitable: business_permit_application, locality: locality) }
    let(:pdf) { described_class.new(permit: permit, voucher: voucher, view_context: ActionView::Base.new ) }
    let(:pdf_content) { PDF::Reader.new(StringIO.new(pdf.render)).page(1).to_s }

    it 'contains the name of the event' do
      puts business_permit_application.vouchers

      expect(pdf_content).to include('Store Ko')

    end
  end
end
