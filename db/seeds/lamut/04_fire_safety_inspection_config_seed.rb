locality = Locations::Locality.find_by(name: 'Lamut')
locality.fire_safety_inspection_configs.create(
  rate: 0.01,
  liability_account: Accounting::Account.find_by(name: "Fire Safety Inspection Fees Payable" ),
  accounts: [locality.police_clearance_configs.recent.revenue_account.id]
)
