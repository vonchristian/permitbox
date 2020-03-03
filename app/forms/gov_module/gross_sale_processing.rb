module GovModule
  class GrossSaleProcessing
    include ActiveModel::Model
    attr_accessor :amount, :calendar_year, :business_id, :business_permit_application_id, :mode_of_payment, :employee_id, :gross_sale_type, :cart_id, :business_id
    validates :amount, :calendar_year, presence: true
    validates :amount, numericality: true

    def process!
      if valid?
        ActiveRecord::Base.transaction do
          create_gross_sale
        
        end
      end 
    end

    private

    def create_gross_sale
      gross_sale = find_business.gross_sales.create!(
      calendar_year: calendar_year,
      gross_sale_type: gross_sale_type,
      amount:        amount)

      create_charge(gross_sale)

    end

    def update_application
      find_business_permit_application.update_attributes!(mode_of_payment: mode_of_payment)
    end
    
    def find_business
      if business_id.present?
        Business.find(business_id)
      else 
        find_business_permit_application.business
      end 
    end
    def find_business_permit_application
      BusinessPermitApplication.find_by(id: business_permit_application_id)
    end

    def create_charge(gross_sale)
      ChargeCalculators::BusinessTax.new(
        gross_sale: gross_sale,
        cart:       find_cart,
      ).create_charges!
    end


    def create_business_tax_payment_schedule
      BusinessTaxPaymentSchedule.new(
      scheduleable:        find_business_permit_application,
      business_tax_amount: find_business.business_tax_category.compute_tax(amount.to_f),
      date:                Time.zone.now,
      employee:            find_employee).
      create_schedule
    end

    def find_employee
      User.find(employee_id)
    end
    def find_cart
      if cart_id.present?
        Cart.find(cart_id)
      else 
        find_business_permit_application.cart 
      end 
    end 
  end
end
