module Tricycles
  class PermitApplication
    include ActiveModel::Model
    attr_accessor :application_date,
                  :application_number,
                  :mtop_number,
                  :plate_number,
                  :make,
                  :tricycle_model,
                  :color,
                  :tricycle_organization_id,
                  :locality_id,
                  :taxpayer_id,
                  :complete_address,
                  :application_type,
                  :account_number,
                  :employee_id,
                  :cart_id,
                  :tricycle_id


    validates :application_date,
              :application_number,
              :application_type,
              :plate_number,
              :make,
              :tricycle_model,
              :color,
              :tricycle_organization_id,
              :taxpayer_id,
              :employee_id,
              :cart_id,
              presence: true
    def find_tricycle
      if tricycle_id.present?
        find_locality.tricycles.find(tricycle_id)
      else 
        find_locality.tricycles.find_by(account_number: account_number)
      end 
    end 

    def find_tricycle_permit_application
      find_locality.tricycle_permit_applications.find_by!(
        account_number: account_number)
    end

    def process!
      ActiveRecord::Base.transaction do
        create_tricycle
        create_permit_application
        create_charges
      end
    end

    private
    def create_tricycle
      if !tricycle_id.present? 
        tricycle = find_locality.tricycles.create!(
        account_number:           account_number,
        mtop_number:              mtop_number,
        plate_number:             plate_number,
        make:                     make,
        tricycle_model:           tricycle_model,
        color:                    color,
        taxpayer:                 find_taxpayer,
        tricycle_organization_id: tricycle_organization_id)
      end 
    end
   

    def create_permit_application
      find_locality.tricycle_permit_applications.create!(
      tricycle:                 find_tricycle,
      taxpayer:                 find_taxpayer,
      application_date:         application_date,
      application_number:       application_number,
      application_type:         application_type,
      account_number:           account_number,
      make:                     make, 
      tricycle_model:           tricycle_model,
      color:                    color,
      tricycle_organization_id: tricycle_organization_id)
    end

    def create_charges
      Tricycles::ChargeSetter.new(tricycle_permit_application: find_tricycle_permit_application, cart: find_cart).set_charges!
    end
    
    def find_cart
      Cart.find(cart_id)
    end

    def find_locality
      find_employee.locality
    end

    def find_employee
      User.find(employee_id)
    end
    def find_taxpayer
      Taxpayer.find(taxpayer_id)
    end
  end
end
