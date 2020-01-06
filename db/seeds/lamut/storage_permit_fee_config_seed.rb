locality = Locations::Locality.municipality.find_by(name: "Lamut")

Configurations::StoragePermitFeeConfig.find_or_create_by(
  locality: locality,
  revenue_account: Accounting::Account.find_by(name: "Storage Permit Fees"),
  minimum_volume: 500,
  maximum_volume: 2000,
  fee_amount: 1_100)

Configurations::StoragePermitFeeConfig.find_or_create_by(
  locality: locality,
  revenue_account: Accounting::Account.find_by(name: "Storage Permit Fees"),
  minimum_volume: 2001,
  maximum_volume: 5000,
  fee_amount: 1_650)

Configurations::StoragePermitFeeConfig.find_or_create_by(
  locality: locality,
  revenue_account: Accounting::Account.find_by(name: "Storage Permit Fees"),
  minimum_volume: 5001,
  maximum_volume: 20_000,
  fee_amount: 2_200)

Configurations::StoragePermitFeeConfig.find_or_create_by(
  locality: locality,
  revenue_account: Accounting::Account.find_by(name: "Storage Permit Fees"),
  minimum_volume: 20_001,
  maximum_volume: 50_000,
  fee_amount: 2_750)

Configurations::StoragePermitFeeConfig.find_or_create_by(
  locality: locality,
  revenue_account: Accounting::Account.find_by(name: "Storage Permit Fees"),
  minimum_volume: 50_001,
  maximum_volume: 100_000,
  fee_amount: 3_300)

Configurations::StoragePermitFeeConfig.find_or_create_by(
  locality: locality,
  revenue_account: Accounting::Account.find_by(name: "Storage Permit Fees"),
  minimum_volume: 100_000,
  maximum_volume: 100_000_000,
  fee_amount: 4_400)
