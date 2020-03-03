class BusinessUpdater
  attr_reader :business_permit_application, :business, :locality

  def initialize(args)
    @business_permit_application = args.fetch(:business_permit_application)
    @business = args.fetch(:business)
    @locality = @business.locality
  end

  def update_business_details
    update_employee_count
    update_business
    update_location
    update_establishment
    update_business_activities
    create_gross_sale
    create_business_tax_payment_schedule
  end
  def update_employee_count
    business.employee_counts.create!(
      locality:    locality,
      date:        business_permit_application.application_date,
      total_count: business_permit_application.employee_count
    )
  end
  def update_business
    business.update_attributes(
      name:                  business_permit_application.business_name,
      mode_of_payment:       business_permit_application.mode_of_payment,
      ownership_type:        business_permit_application.ownership_type,
      business_tax_category: business_permit_application.business_tax_category
    )
  end
  def update_location
    if business.current_location.present?
      business.current_location.update_attributes(
        barangay:         business_permit_application.barangay,
        street:           business_permit_application.street,
        complete_address: business_permit_application.complete_address
      )
    else
      business.locations.create(
        barangay: business_permit_application.barangay,
        street: business_permit_application.street,
        complete_address: business_permit_application.complete_address
      )
    end
  end

  def update_establishment
    if business.recent_establishment.present?
      establishment = business.recent_establishment
      establishment.update_attributes(
        leased: business_permit_application.rented,
        monthly_rental: business_permit_application.monthly_rental
      )
      if business_permit_application.public_market_id.present?
        establishment.tenancies.create!(
          public_market_id: business_permit_application.public_market_id,
          tenancy_type: business_permit_application.tenancy_type
        )
      end
      establishment.area_measurements.create!(
        area: business_permit_application.business_area,
        date: business_permit_application.application_date
      )
    elsif business.recent_establishment.blank?
      establishment = business.establishments.create(
        leased: business_permit_application.rented,
        monthly_rental: business_permit_application.monthly_rental
      )
      if business_permit_application.public_market_id.present?
        establishment.tenancies.create!(
          public_market_id: business_permit_application.public_market_id,
          tenancy_type: business_permit_application.tenancy_type
        )
      end
      establishment.area_measurements.create!(
        area: business_permit_application.business_area,
        date: business_permit_application.application_date
      )
    end
  end

  def update_business_activities
    business_permit_application.business_activities.each do |business_activity|
      business.business_activities.find_or_create_by(line_of_business: business_activity.line_of_business, quantity: business_activity.quantity)
    end
  end
  def create_gross_sale
    business.gross_sales << business_permit_application.gross_sales
  end
  
end
