locality = Locations::Locality.find_by(name: 'Lamut')
locality.police_clearance_configs.create(
  revenue_account: Accounting::Revenue.find_by(name: "Police Clearance Fees"),
  fee_amount: 50.0
)
