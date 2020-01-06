class BusinessTaxReceivable < ApplicationRecord
  belongs_to :business, optional: true
  belongs_to :business_permit_application, optional: true
  belongs_to :employee, class_name: "User"

  def self.recent
    order(date: :desc).first
  end
end
