module Tricycles
  class Assessment
    include ActiveModel::Model
    attr_accessor :tricycle_permit_application_id, :date, :employee_id, :account_number, :reference_number, :description, :cart_id
    validates :reference_number, :description, :date, :employee_id, :tricycle_permit_application_id, :cart_id, presence: true
    def process!
      ActiveRecord::Base.transaction do
        create_voucher
        remove_cart_reference
        update_permit_application_voucher_reference
      end
    end
    def find_voucher
      Voucher.find_by!(account_number: find_tricycle_permit_application.account_number)
    end

    private

    def create_voucher
      voucher = Voucher.create!(
        description:    "#{description} - #{find_tricycle_permit_application.taxpayer.full_name}",
        locality:       find_tricycle_permit_application.locality,
        preparer_id:    employee_id,
        account_number: find_tricycle_permit_application.account_number,
        payee:          find_tricycle_permit_application.taxpayer,
        date:           date)
      voucher.voucher_amounts << find_cart.voucher_amounts
    end

    def remove_cart_reference
      find_voucher.voucher_amounts.each do |voucher_amount|
        voucher_amount.cart_id = nil
        voucher_amount.save!
      end
    end

    def find_cart
      Cart.find(cart_id)
    end

    def find_tricycle_permit_application
      ::Tricycles::TricyclePermitApplication.find(tricycle_permit_application_id)
    end
    
    def update_permit_application_voucher_reference
      find_tricycle_permit_application.update(voucher: find_voucher)
    end
  end
end
