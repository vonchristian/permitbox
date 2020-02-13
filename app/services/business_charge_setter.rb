class BusinessChargeSetter
  attr_reader :chargeable, :locality, :business_tax_category, :barangay, :gross_sale, :business_area, :business_tax_amount, :gross_sale_amount, :gross_sale_essential

  def initialize(args)
    @chargeable             = args[:chargeable]
    @locality              = args[:locality]
    @barangay              = args[:barangay]
    @business_area         = args[:business_area]
    @business_tax_amount   = args[:business_tax_amount]
  end

  def set_charges
    set_barangay_charges
    set_default_charges
    set_mayors_permit_fees
    # set_sanitary_inspection_fee
    # set_fire_safety_inspection_fee
    # set_zoning_fee
    # set_annual_inspection_fee
    # set_building_permit_fee
    # set_documentary_stamp_tax
    # set_electrical_installation_fee
    # set_occupancy_permit_fee
    # set_plumbing_installation_fee
    # set_sealing_fee
    # set_surcharge_fee
    # set_penalty_fee
  end

  private
  def set_barangay_charges
    barangay.charges.each do |charge|
      chargeable.voucher_amounts.credit.create!(
        amount: charge.amount,
        name: charge.name,
        account: charge.revenue_account)
    end
  end

  def set_default_charges
    locality.charges.default.for_business.each do |charge|
      chargeable.voucher_amounts.credit.create!(
        amount: charge.amount,
        name: charge.name,
        account: charge.revenue_account)
    end
  end

  def set_mayors_permit_fees
    chargeable.line_of_businesses.each do |line_of_business|
      chargeable.voucher_amounts.credit.create!(
      name: "Mayors Permit Fee (#{line_of_business.name})",
      amount: line_of_business.fee_amount,
      account: chargeable.business_activities.find_by(line_of_business: line_of_business).revenue_account)
    end
  end
  def set_barangay_clearance_fee
    chargeable.voucher_amounts.create(
      name:    "Barangay Clearance Fee (#{barangay.name})",
      amount:  barangay.barangay_clearance_fee,
      account: barangay.liability_account)
  end

  def set_police_clearance_fee
    chargeable.voucher_amounts.create!(
      name:    "Police Clearance Fee",
      amount:  locality.police_clearance_configs.recent.fee_amount,
      account: locality.police_clearance_configs.recent.revenue_account)
  end

  def set_health_certificate_fee
    chargeable.voucher_amounts.create!(
      name:    "Health Certificate Fee",
      amount:  locality.health_certificate_configs.recent.fee_amount,
      account: locality.health_certificate_configs.recent.revenue_account)
  end
  def set_sanitary_inspection_fee
    chargeable.voucher_amounts.create!(
      name:    "Sanitary Inspection Fee",
      amount:  Configurations::SanitaryInspectionConfig.set_amount_for(business_area),
      account: locality.sanitary_inspection_revenue_account)
  end

  def set_fire_safety_inspection_fee
    chargeable.voucher_amounts.create!(
      name:    "Fire Safety Inspection Fee",
      amount:  Configurations::FireSafetyInspectionConfig.recent.compute_fee(chargeable),
      account: locality.fire_safety_inspection_configs.recent.liability_account
    )
  end
  def set_zoning_fee
    chargeable.voucher_amounts.create!(
      name:    "Zoning Fee",
      amount:  locality.zoning_fee_configs.recent.fee_amount,
      account: locality.zoning_revenue_account
    )
  end
  def set_annual_inspection_fee
    chargeable.voucher_amounts.create!(
      name:    "Annual Inspection Fee",
      amount:  locality.annual_inspection_fee_configs.recent.fee_amount,
      account: locality.annual_inspection_fee_configs.recent.revenue_account
    )
  end
  def set_building_permit_fee
    chargeable.voucher_amounts.create!(
      name:    "Building Permit Fee",
      amount:  locality.building_permit_fee_configs.recent.fee_amount,
      account: locality.building_permit_fee_configs.recent.revenue_account
    )
  end
  def set_documentary_stamp_tax
    chargeable.voucher_amounts.create!(
      name:    "Documentary Stamp Tax",
      amount:  locality.documentary_stamp_tax_configs.recent.fee_amount,
      account: locality.documentary_stamp_tax_configs.recent.revenue_account
    )
  end
  def set_electrical_installation_fee
    chargeable.voucher_amounts.create!(
      name:    "Electrical Installation Fee",
      amount:  locality.electrical_installation_fee_configs.recent.fee_amount,
      account: locality.electrical_installation_fee_configs.recent.revenue_account
    )
  end
  def set_occupancy_permit_fee
    chargeable.voucher_amounts.create!(
      name:    "Occupancy Permit Fee",
      amount:  locality.occupancy_permit_fee_configs.recent.fee_amount,
      account: locality.occupancy_permit_fee_configs.recent.revenue_account
    )
  end
  def set_plumbing_installation_fee
    chargeable.voucher_amounts.create(
      name:    "Plumbing Installation Fee",
      amount:  locality.plumbing_installation_fee_configs.recent.fee_amount,
      account: locality.plumbing_installation_fee_configs.recent.revenue_account
    )
  end
  def set_sealing_fee
    chargeable.voucher_amounts.create(
      name:    "Sealing Fee",
      amount:  locality.sealing_fee_configs.recent.fee_amount,
      account: locality.sealing_fee_configs.recent.revenue_account
    )
  end
  def set_surcharge_fee
    chargeable.voucher_amounts.create!(
      name:    "Surcharge Fee",
      amount:  0,
      account: locality.surcharge_revenue_account
    )
  end
  def set_penalty_fee
    chargeable.voucher_amounts.create!(
      name:    "Penalty Fee",
      amount:  0,
      account: locality.penalty_revenue_account
    )
  end
end
