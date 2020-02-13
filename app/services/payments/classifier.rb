module Payments
  class Classifier
    attr_reader :voucher,  :business

    def initialize(args={})
      @voucher  = args.fetch(:voucher)
      @business = args.fetch(:business)
    end

    def mayors_permit_fees
      if business.business_activities.revenue_accounts.present?
       voucher.voucher_amounts.where(account: business.business_activities.revenue_accounts).total 
      else 
       voucher.voucher_amounts.where(account: business.line_of_business_categories.revenue_accounts).total 
      end
    end

    def business_taxes
      if business.business_tax_revenue_account.present?
        voucher.voucher_amounts.where(account: business.business_tax_revenue_account).total 
      else
        voucher.voucher_amounts.where(account: business.business_tax_category.revenue_account).total
      end
    end
  end
end
