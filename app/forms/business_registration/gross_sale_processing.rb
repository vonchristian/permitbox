module BusinessRegistration
  class GrossSaleProcessing
    include ActiveModel::Model
    attr_accessor :amount, :calendar_year, :business_id, :voucher_id, :essential
    validates :amount, :calendar_year, presence: true
    validates :amount, numericality: true
    def process!
      ActiveRecord::Base.transaction do
        create_gross_sale
      end
    end


    private
    def create_gross_sale
      gross_sale = find_business.gross_sales.create!(
        calendar_year: calendar_year,
        amount: amount)
      create_charge(gross_sale)
    end

    def find_business
      Business.find_by_id(business_id)
    end

    def create_charge(gross_sale, find_business)
      find_business.business_tax_category.create_charge(gross_sale)
    end
  end
end
