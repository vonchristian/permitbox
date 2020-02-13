module Businesses 
  class BusinessCharge < ApplicationRecord
    belongs_to :business, optional: true
    belongs_to :business_permit_application, optional: true
    belongs_to :revenue_account, class_name: 'Accounting::Revenue'
    belongs_to :charge 

    delegate :name, to: :charge, prefix: true
  end
end 