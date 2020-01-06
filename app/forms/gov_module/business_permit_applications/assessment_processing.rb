module GovModule
  module BusinessPermitApplications
    class AssessmentProcessing
      include ActiveModel::Model
      attr_accessor :business_permit_application_id, :account_number, :description, :date, :employee_id, :reference_number, :locality_id
      validates :business_permit_application_id, :account_number, :reference_number, :date, :employee_id, :locality_id, :description, presence: true

      def find_voucher
        Voucher.find_by(account_number: account_number)
      end

      def process!
        ActiveRecord::Base.transaction do
          create_assessment_voucher
          create_or_update_business
        end
      end


      private
      def create_assessment_voucher
        voucher = Voucher.create!(
          account_number:   account_number,
          preparer:         find_employee,
          reference_number: reference_number,
          description: "#{description} - #{find_business_permit_application.taxpayer_full_name}",
          date:             date,
          locality_id:      locality_id,
          payee:            find_business_permit_application
        )
        voucher.voucher_amounts << find_business_permit_application.voucher_amounts
      end

      def find_business_permit_application
        BusinessPermitApplication.find(business_permit_application_id)
      end

      def find_business
        find_business_permit_application.business
      end
      def find_employee
        User.find(employee_id)
      end

      def create_or_update_business
        if find_business.blank?
          create_business
          update_business
        else
          update_business

        end
      end

      def create_business
        GovModule::Businesses::Registration.new(business_permit_application: find_business_permit_application).register!
      end

      def update_business
        BusinessUpdater.new(
          business_permit_application: find_business_permit_application,
          business:                    find_business
        ).update_business_details
      end
    end
  end
end
