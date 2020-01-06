module GovModule
  module Businesses
    class BusinessActivityProcessing
      include ActiveModel::Model
      attr_accessor :quantity, :business_id, :line_of_business_id, :volume

      def process!
        ActiveRecord::Base.transaction do
          create_business_activity
          add_charge_to_business_charges
        end
      end
      def find_business_activity
        find_business.business_activities.find_by(line_of_business_id: line_of_business_id)
      end

      private
      def create_business_activity
        find_business.business_activities.find_or_create_by!(
          line_of_business: find_line_of_business,
          volume: volume.to_f,
          quantity: quantity)
      end
      def add_charge_to_business_charges
        Vouchers::VoucherAmount.create!(
          name: find_line_of_business.name,
          amountable: find_business,
          amount: find_line_of_business.fee_amount.to_f * quantity.to_f,
          account: find_line_of_business.revenue_account)
        if find_line_of_business.has_storage_permit_fee?
          set_storage_permit_fee
        end
      end
      def find_business
        Business.find(business_id)
      end
      def find_line_of_business
        LineOfBusiness.find(line_of_business_id)
      end
      def set_storage_permit_fee
        storage = Configurations::StoragePermitFeeConfig.find_applicable_for(find_business_activity)
        find_business.voucher_amounts.create(
          name: "Storage Permit Fee",
          amount: storage.fee_amount,
          account: storage.revenue_account
        )
      end
    end
  end
end
