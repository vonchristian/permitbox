class AddBusinessPermitApplicationToBusinessTaxReceivables < ActiveRecord::Migration[5.2]
  def change
    add_reference :business_tax_receivables,
    :business_permit_application, foreign_key: true, type: :uuid,
    index: { name: "index_business_permit_application_on_tax_receivables" }
  end
end
