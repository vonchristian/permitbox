locality = Locations::Locality.find_by(name: 'Lamut')

locality.charges.for_business.create(
  name: "Police Clearance Fee",
  amount: 50

)

# locality.zoning_fee_configs.create(
#   fee_amount: 50,
#   revenue_account: Accounting::Account.find_by(name: "Zonal/Location Permit Fees")
# )

locality.annual_inspection_fee_configs.create(
  fee_amount: 0,
  revenue_account: Accounting::Account.find_by(name: "Annual Inspection Fees")
)
locality.building_permit_fee_configs.create(
  fee_amount: 0,
  revenue_account: Accounting::Account.find_by(name: "Building Permit Fees")
)
doc_stamp = locality.documentary_stamp_tax_configs.create(
  fee_amount: 15,
  revenue_account: Accounting::Account.find_by(name: "Documentary Stamp Fees"))

doc_stamp.accounts << Accounting::Revenue.find_by(name: "Police Clearance Fees").id
doc_stamp.accounts << Accounting::Revenue.find_by(name: "Health Certificate Fees").id

locality.electrical_installation_fee_configs.create(
  fee_amount: 0,
  revenue_account: Accounting::Account.find_by(name: "Occupancy Permit Fees")
)

locality.occupancy_permit_fee_configs.create(
  fee_amount: 0,
  revenue_account: Accounting::Account.find_by(name: "Electrical Installation Fees")
)

locality.plumbing_installation_fee_configs.create(
  fee_amount: 0,
  revenue_account: Accounting::Account.find_by(name: "Plumbing Installation Fees")
)
locality.sealing_fee_configs.create(
  fee_amount: 0,
  revenue_account: Accounting::Account.find_by(name: "Sealing Fees")
)
