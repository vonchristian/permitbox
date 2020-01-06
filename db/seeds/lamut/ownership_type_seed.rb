locality = Locations::Locality.municipality.find_by(name: "Lamut")

OwnershipType.create(
  locality: locality,
  title: "Sole Proprietorship",
  description: "I own/control the business entirely by myself")
OwnershipType.create(
  locality: locality,
  title: "Partnership",
  description: "I own/control the business with other people/partners")

OwnershipType.create(
  locality: locality,
  title: "Corporation",
  description: "I set up a separate entity/artificial person by law")
OwnershipType.create(
  locality: locality,
  title: "Cooperative",
  description: "cooperative")
