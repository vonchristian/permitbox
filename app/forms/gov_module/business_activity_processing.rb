module GovModule
  class BusinessActivityProcessing
    include ActiveModel::Model
    attr_accessor :quantity, :business_id, :business_permit_application_id, :line_of_business_id, :volume, :employee_id, :cart_id

    def process!
      ActiveRecord::Base.transaction do
        create_business_activity
      end
    end
    def find_business_activity
      find_business.business_activities.find_by(line_of_business_id: line_of_business_id)
    end

    private

    def create_business_activity
      if find_business.business_activities.cancelled.find_by(line_of_business_id: line_of_business_id).present?
        business_activity = find_business.business_activities.cancelled.find_by(line_of_business_id: line_of_business_id)
        business_activity.update(
          cancelled_at: nil,
          volume: volume.to_f,
          quantity: quantity
        )
      else 
        business_activity = find_business.business_activities.build(
          line_of_business: find_line_of_business,
          volume:           volume.to_f,
          quantity:         quantity)
          create_accounts(business_activity)
          business_activity.save! 
  
        end 
        create_charges(business_activity)
      end 


    def create_accounts(business_activity)
      AccountCreators::Businesses::BusinessActivityRevenueAccount.new(business_activity: business_activity).create_accounts!
    end 

    def create_charges(business_activity)
      ChargeCalculators::MayorsPermitFee.new(
        chargeable:        find_business_permit_application,
        quantity:          quantity.to_f,
        business_activity: business_activity,
        cart:              find_cart
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

    def find_business
      find_locality.businesses.find(business_id)
    end

    def find_locality
      find_employee.locality
    end 

    def find_employee
      User.find(employee_id)
    end 

    def find_cart
      Cart.find(cart_id)
    end 
  end
end
