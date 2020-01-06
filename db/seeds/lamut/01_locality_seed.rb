 mayors_permit_fee_calculation_config = Configurations::MayorsPermitFeeCalculationConfig.create(config_type: "per_line_of_business")
capital_tax_revenue_account = Accounting::Revenue.find_by(name: 'Capital Tax')
sanitary_inspection_revenue_account = Accounting::Revenue.find_by(name: "Sanitary Inspection Fees")
police_clearance_revenue_account = Accounting::Revenue.find_by(name: "Police Clearance Fees")
surcharge_revenue_account = Accounting::Revenue.find_by(name: "Surcharges")
zoning_revenue_account = Accounting::Revenue.find_by(name: "Zonal/Location Permit Fees")
penalty_revenue_account = Accounting::Revenue.find_by(name: "Fines and Penalties - Business Income")



locality = Locations::Locality.municipality.find_or_create_by!(
  name: "Lamut",
  business_tax_computation_config: Configurations::BusinessTaxComputationConfig.find_by(computation_type: 'based_on_gross_sales'),
  capital_tax_revenue_account: capital_tax_revenue_account,
  mayors_permit_fee_calculation_config: mayors_permit_fee_calculation_config,
  sanitary_inspection_revenue_account: sanitary_inspection_revenue_account,
  police_clearance_revenue_account: police_clearance_revenue_account,
  zoning_revenue_account: zoning_revenue_account,
  penalty_revenue_account: penalty_revenue_account,
  surcharge_revenue_account: surcharge_revenue_account )


#OFFICES
engineering_office = Office.create(locality: locality, name: "Municipal Engineering Office")
mayors_office      = Office.create(locality: locality, name: "Municipal Mayor's Office")
health_office      = Office.create(locality: locality, name: "Municipal Health Office")
treasury_office    = Office.create(locality: locality, name: "Municipal Treasury Office")
bplo_office        = Office.create(locality: locality, name: "Business Permits and Licensing Office")
pnp_office         = Agency.create(name: "Philippine National Police")
bfp_office         = Agency.create(name: "Beaureu of Fire Protection")
planning_office    = Office.create(locality: locality, name: "Municipal Planning and Development Office")
barangay_office    = Office.create(locality: locality, name: "Barangay Hall")
market_office      = Office.create(locality: locality, name: "Market Administrator Office")
bfad_office        = Agency.create(name: "Beaureu of Foods and Drugs" )
#Documents
Document.find_or_create_by!(
  locality: locality,
  title: "Barangay Clearance",
  issuing_office: barangay_office)
Document.find_or_create_by!(
  locality: locality,
  title: "Barangay Business Clearance",
  issuing_office: barangay_office)
Document.find_or_create_by!(
  locality: locality,
  title: "Residence Certificate(Cedula)",
  issuing_office: barangay_office)
Document.find_or_create_by!(
  title: "Police Clearance",
  issuing_office: pnp_office)
Document.find_or_create_by!(
  title: "Fire Safety Inspection Certificate",
  issuing_office: bfp_office)
Document.find_or_create_by!(
  locality: locality,
  title: "Occupancy Permit",
  issuing_office: engineering_office)
Document.find_or_create_by!(
  locality: locality,
  title: "Sanitary Permit",
  issuing_office: health_office)
Document.find_or_create_by!(
  locality: locality,
  title: "Health Clearance",
  issuing_office: health_office)
Document.find_or_create_by!(
  locality: locality,
  title: "Market Clearance",
  issuing_office: market_office)
Document.find_or_create_by!(
  title: "BFAD Permit",
  issuing_office: bfad_office)
Document.find_or_create_by!(
  locality: locality,
  title: "Videoke Task Force Compliance Certificate",
  issuing_office: mayors_office)
Document.find_or_create_by!(
  locality: locality,
  title: "Zoning/Locational Clearance",
  issuing_office: planning_office)


#Charges
sanitary_inspection_account     = Accounting::Revenue.find_by(name: "Sanitary Inspection Fees", active: true)
garbage_revenue_account         = Accounting::Revenue.find_by(name: "Garbage Fees", active: true)
building_inspection_account     = Accounting::Revenue.find_by(name: 'Building Permit Fees', active: true)
electrical_installation_account = Accounting::Revenue.find_by(name: "Electrical Installation Fees", active: true)
mechanical_inspection_account   = Accounting::Revenue.find_by(name: "Mechanical Inspection Fees", active: true)
plumbing_inspection_account     = Accounting::Asset.find_by(name: 'Plumbing Installation Fees', active: true)
storage_permit_account          = Accounting::Revenue.find_by(name: "Storage Permit Fees", active: true)
police_clearance_account        = Accounting::Revenue.find_by(name: "Police Clearance Fees")
engineering_clearance_account   = Accounting::Revenue.find_by(name: "Engineering Clearance")
mtop_revenue_account            = Accounting::Revenue.find_by(name: "MTOP Plate Fees")
sticker_fee_revenue_account     = Accounting::Revenue.find_by(name: "Sticker Fees")
tricycle_mayors_permit_revenue_account = Accounting::Revenue.find_by(name: "Tricycle Permit Fees")
filing_fee_revenue_account = Accounting::Revenue.find_by(name: "Tricycle Permit Filing Fees")
parking_fee_revenue_account = Accounting::Revenue.find_by(name: "Parking Fees")
franchise_fee_revenue_account = Accounting::Revenue.find_by(name: "Franchise Fees", active: true)
Charge.create(
  locality: locality,
  name: "Police Clearance Fee",
  amount: 55.00,
  revenue_account: police_clearance_account)

Charge.for_business.create(
  locality: locality,
  name: "Business Plate",
  amount: 55,
  revenue_account: sanitary_inspection_account)

Charge.for_business.create!(
  locality: locality,
  name: "Garbage Fee (Commercial Establishments)",
  amount: 420.00,
  revenue_account: garbage_revenue_account
  )

Charge.for_business.create!(
  locality: locality,
  name: "Garbage Fee (Residential Establishments)",
  amount: 300,
  revenue_account: garbage_revenue_account
   )
Charge.for_tricycle.find_or_create_by(
  locality: locality,
  name: "Tricycle Mayor's Permit",
  amount: 231.00,
  revenue_account: tricycle_mayors_permit_revenue_account)
Charge.for_tricycle.find_or_create_by(
  locality: locality,
  name: "Filing Fee",
  amount: 165.00,
  revenue_account: filing_fee_revenue_account)
Charge.for_tricycle.find_or_create_by(
  locality: locality,
  name: "Parking Fee",
  amount: 165.00,
  revenue_account: parking_fee_revenue_account)
Charge.for_tricycle.find_or_create_by(
  locality: locality,
  name: "Franchise Fee",
  amount: 75.00,
  revenue_account: franchise_fee_revenue_account)
Charge.for_tricycle.find_or_create_by(
  locality: locality,
  name: "MTOP Plate",
  amount: 120.00,
  revenue_account: mtop_revenue_account)
Charge.find_or_create_by(
  locality: locality,
  name: "Sticker Fee",
  amount: 55.00,
  revenue_account: sticker_fee_revenue_account)
