locality = Locations::Locality.find_by(name: 'Lamut')
locality.health_certificate_configs.create(
  revenue_account: Accounting::Revenue.find_by(name: "Health Certificate Fees"),
  fee_amount: 150.0
)
