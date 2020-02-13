module Payments
  class Classifier
    attr_reader :entry,  :business

    def initialize(args={})
      @entry    = args[:entry]
      @business = args.fetch(:business)
    end

    def mayors_permit_fees
      if entry.present?
        entry.amounts.where(account: business.line_of_business_categories.revenue_accounts ).total
      else
        0
      end
    end
    def business_taxes
      if entry.present?
        entry.amounts.where(account: BusinessTaxCategory.revenue_accounts).total
      else
        0
      end
    end
  end
end
