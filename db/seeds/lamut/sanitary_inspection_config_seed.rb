locality = Locations::Locality.municipality.find_by(name: "Lamut")
Configurations::SanitaryInspectionConfig.find_or_create_by(
  locality: locality,
  minimum_area: 1,
  maximum_area: 49.99,
  fee_amount: 55)
Configurations::SanitaryInspectionConfig.find_or_create_by(
  locality: locality,
  minimum_area: 50,
  maximum_area: 199.99,
  fee_amount: 66)
Configurations::SanitaryInspectionConfig.find_or_create_by(
  locality: locality,
  minimum_area: 200,
  maximum_area: 499.99,
  fee_amount: 77)
Configurations::SanitaryInspectionConfig.find_or_create_by(
  locality: locality,
  minimum_area: 500,
  maximum_area: 999.99,
  fee_amount: 88)
Configurations::SanitaryInspectionConfig.find_or_create_by(
  locality: locality,
  minimum_area: 1000,
  maximum_area: 99_999.99,
  fee_amount: 110)
