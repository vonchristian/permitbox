User.create(
  role: 'bplo_officer',
  email: 'bpls@lamut.gov.ph',
  password: '11111111',
  password_confirmation: '11111111',
  locality: Locations::Locality.last)

User.create(
  role: 'collection_officer',
  email: 'collection@lamut.gov.ph',
  password: '11111111',
  password_confirmation: '11111111',
  locality: Locations::Locality.last)
