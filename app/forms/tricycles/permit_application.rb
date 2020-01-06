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
                  :cart_id
  validate :unique_application_number?

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
      find_locality.tricycles.find_by!(account_number: account_number)
    end
    def find_permit_application
      find_tricycle.permit_applications.find_by!(
        account_number: account_number)
    end
    def process!
      ActiveRecord::Base.transaction do
        create_tricycle
      end
    end

    private
    def create_tricycle
      tricycle = find_locality.tricycles.build(
        account_number:           account_number,
        mtop_number:              mtop_number,
        plate_number:             plate_number,
        make:                     make,
        tricycle_model:           tricycle_model,
        color:                    color,
        tricycle_organization_id: tricycle_organization_id
      )
      AccountCreators::Tricycle.new(tricycle: tricycle, account_number: account_number).create_accounts!
      tricycle.save!
      create_ownership(tricycle)
      create_permit_application(tricycle)
      create_charges(tricycle)

    end
    def create_ownership(tricycle)
      tricycle.taxpayer_owners << find_taxpayer
    end

    def create_permit_application(tricycle)
      tricycle.permit_applications.create!(
        locality:           find_locality,
        applicant:          find_taxpayer,
        application_date:   application_date,
        application_number: application_number,
        application_type:   application_type,
        account_number:     account_number
      )
    end

    def create_charges(tricycle)
      Tricycles::ChargeSetter.new(tricycle: tricycle, cart: find_cart).set_charges!
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

    private

    def unique_application_number?
      errors[:application_number] << "already been taken" if PermitApplications::TricyclePermitApplication.find_by(application_number: application_number).present?
    end
  end
end
