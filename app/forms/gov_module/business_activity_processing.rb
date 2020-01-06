module GovModule
  class BusinessActivityProcessing
    include ActiveModel::Model
    attr_accessor :quantity, :business_id, :business_permit_application_id, :line_of_business_id, :volume

    def process!
      ActiveRecord::Base.transaction do
        create_business_activity
        create_charges
      end
    end
    def find_business_activity
      find_applicant.business_activities.find_by(line_of_business_id: line_of_business_id)
    end

    private
    def create_business_activity
      find_applicant.business_activities.find_or_create_by!(
        line_of_business: find_line_of_business,
        volume: volume.to_f,
        quantity: quantity)
    end
    def create_charges
      ChargeCalculators::MayorsPermitFee.new(
        chargeable: find_applicant,
        quantity: quantity.to_f,
        line_of_business: find_line_of_business
      ).calculate_charge
      if find_line_of_business.has_storage_permit_fee?
        set_storage_permit_fee
      end
    end
    def find_business
      Business.find_by(id: business_id)
    end
    def find_business_permit_application
      BusinessPermitApplication.find_by(id: business_permit_application_id)
    end
    def find_line_of_business
      LineOfBusiness.find(line_of_business_id)
    end
    
    def set_storage_permit_fee
      ChargeCalculators::StoragePermitFee.new(
        chargeable: find_applicant,
        business_activity: find_business_activity).calculate_charge
    end

    def find_applicant
      if find_business.present?
        find_business
      elsif find_business_permit_application.present?
        find_business_permit_application
      end
    end

  end
end
