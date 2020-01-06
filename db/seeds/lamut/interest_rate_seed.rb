locality = Locations::Locality.municipality.find_or_create_by(name: "Lamut")

Configurations::InterestRate.create(locality: locality, rate: 0.02)
