module GovModule
  class GrossSaleProcessing
    include ActiveModel::Model
    attr_accessor :amount, :calendar_year, :business_id, :business_permit_application_id, :mode_of_payment, :employee_id, :gross_sale_type
    validates :amount, :calendar_year, presence: true
    validates :amount, numericality: true

    def process!
      ActiveRecord::Base.transaction do
        create_gross_sale
        create_business_tax_payment_schedule
        update_application
      end
    end

    private
    def create_gross_sale
      gross_sale = find_grossable.gross_sales.create!(
      calendar_year: calendar_year,
      gross_sale_type: gross_sale_type,
      amount:        amount)

      set_discounts(gross_sale)
      create_charge(gross_sale)

    end
    def update_application
      find_business_permit_application.update_attributes!(mode_of_payment: mode_of_payment)
    end
    def find_grossable
      if find_business.present?
        find_business
      elsif find_business_permit_application.present?
        find_business_permit_application
      end
    end


    def find_business
      Business.find_by(id: business_id)
    end
    def find_business_permit_application
      BusinessPermitApplication.find_by(id: business_permit_application_id)
    end

    def create_charge(gross_sale)
      ChargeCalculators::BusinessTax.new(
        charge_name: "Business Tax (#{gross_sale_type.titleize})",
        business_tax_amount: ::Businesses::GrossSalesTaxComputation.new(gross_sale: gross_sale).compute_tax!,
        chargeable: find_grossable,
        revenue_account: find_grossable.business.tax_revenue_account,
      ).calculate_charge
    end


    def create_business_tax_payment_schedule
      BusinessTaxPaymentSchedule.new(
      scheduleable:        find_business_permit_application,
      business_tax_amount: find_business_permit_application.business_tax_category.compute_tax(amount.to_f),
      date:                find_business_permit_application.application_date,
      employee:            find_employee).
      create_schedule
    end
    def find_employee
      User.find(employee_id)
    end

    def set_discounts(gross_sale)
      BusinessDiscountSetter.new(
        discountable: find_business_permit_application,
      ).set_discounts
    end
  end
end
