# locality = Locations::Locality.city.find_by(name: "Baguio")
# revenue_account = Accounting::Revenue.find_by(name: 'Business Tax')
# locality.business_tax_categories.find_or_create_by(
#   title: "Manufacturers",
#   description: "Manufacturers, importers, or producers of any article of commerce
#   including brewers, distillers, repackers and compounders of liquors, distilled spirits and wines",
#   revenue_account: revenue_account,
#   unearned_income_account: revenue_account,
#   receivable_account: revenue_account)
#
# locality.business_tax_categories.find_or_create_by(
#   title: "Wholesalers",
#   description: "Wholesalers, distributors, or dealers in any article of commerce of whatever kind and nature",
#   revenue_account: revenue_account,
#   unearned_income_account: revenue_account,
#   receivable_account: revenue_account)
#
# locality.business_tax_categories.find_or_create_by(
#   title: "Exporters",
#   description: "",
#   revenue_account: revenue_account,
#   unearned_income_account: revenue_account,
#   receivable_account: revenue_account)
#
#
# locality.business_tax_categories.find_or_create_by(
#   title: "Retailers",
#   description: "",
#   revenue_account: revenue_account,
#   unearned_income_account: revenue_account,
#   receivable_account: revenue_account)
#
# locality.business_tax_categories.find_or_create_by(
#   title: "Contractors",
#   description: "Contractors, proprietors, owners of establishments rendering service",
#   revenue_account: revenue_account,
#   unearned_income_account: revenue_account,
#   receivable_account: revenue_account)
