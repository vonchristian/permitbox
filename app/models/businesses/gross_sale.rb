module Businesses
  class GrossSale < ApplicationRecord
    enum gross_sale_type: [:non_essential, :essential]
    belongs_to :business
    delegate :business_tax_category, :business_tax_payable_amount, to: :business
    
    validates :calendar_year, presence: true
    validates :amount, presence: true, numericality: true

    def self.current
      order(calendar_year: :desc).first
    end

    def self.for_calendar_year(year)
      where(calendar_year: year).first
    end

    def business_tax
      business_tax_category.compute_tax(amount)
    end
  end
end
