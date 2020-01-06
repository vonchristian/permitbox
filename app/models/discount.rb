class Discount < ApplicationRecord
  enum discount_scope: [:for_business, :for_tricycle, :for_real_property, :applicable_to_all]
  enum discount_type: [:percent_based, :amount_based]

  belongs_to :locality,         class_name: "Locations::Locality"
  belongs_to :discount_account, class_name: "Accounting::Account"

  def self.discounted_accounts
    ids = pluck(:discounted_account_ids).flatten.uniq
    Accounting::Account.where(id: ids)
  end

  def discount_amount(discountable) #refactor
    if percent_based?
      discountable_amount_for(discountable) * rate
    elsif amount_based?
      amount
    end
  end

  def discounted_accounts
    Accounting::Account.where(id: discounted_account_ids)
  end
  
  private

  def discountable_amount_for(discountable) #refactor
    if discounted_accounts.include?(discountable.try(:business_tax_category).try(:revenue_account))
      discountable.business_tax
    else
      discountable.voucher_amounts.where(account: discounted_accounts).total
    end
  end
end
