module GovModule
  module PermitApplications
    class BusinessPermitIssuance
      include ActiveModel::Model
      attr_accessor :permitable_id, :approval_date, :expiry_date, :permit_number,
      :account_number, :permit_type, :plate_number, :signatory_id
      validates :approval_date, :expiry_date, :permit_type, :permit_number, :signatory_id, presence: true
      def process!
        ActiveRecord::Base.transaction do
          issue_permit
        end
      end

      def find_permit
        Permit.find_by(account_number: account_number)
      end

      private
      def issue_permit
        permit = Permit.create!(
        type:           "Permits::BusinessPermit",
        permit_type:    permit_type,
        locality:       find_permitable.locality,
        permitable:     find_permitable,
        approval_date:  approval_date,
        account_number: account_number,
        permit_number:  permit_number,
        plate_number:   plate_number,
        expiry_date:    expiry_date)

        create_permit_signatory(permit)
      end
      def create_permit_signatory(permit)
        PermitSignatory.create(
          permit: permit,
          signatory_id: signatory_id)
      end

      def find_permitable
        BusinessPermitApplication.find_by(id: permitable_id)
      end
    end
  end
end
