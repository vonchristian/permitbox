module BusinessRegistration
  class BusinessActivityProcessing
    include ActiveModel::Model
    attr_accessor :cart_id, :line_of_business_id, :volume

    def process!
      ActiveRecord::Base.transaction do
        create_business_activity
        create_charges
      end
    end

    private
    def create_business_activity
      find_cart.line_of_businesses << find_line_of_business
    end
    def create_charges
      Vouchers::VoucherAmount.create(
      name:       find_line_of_business.name,
      amountable: find_cart,
      amount:     find_line_of_business.fee_amount,
      account:    find_line_of_business.revenue_account)
      if find_line_of_business.line_of_business_charges.present?
        find_line_of_business.line_of_business_charges.each do |charge|
          Vouchers::VoucherAmount.create!(
            name:       charge.name,
            amountable: find_cart,
            amount:     charge.amount,
            account:    charge.revenue_account
          )
        end
      end
    end

    def find_cart
      Cart.find_by_id(cart_id)
    end
    def find_line_of_business
      LineOfBusiness.find_by_id(line_of_business_id)
    end
  end
end
