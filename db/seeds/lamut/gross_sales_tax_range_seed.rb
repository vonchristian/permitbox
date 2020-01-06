locality = Locations::Locality.municipality.find_by(name: "Lamut")

discount_account = Accounting::Revenue.find_by(name: "Discount on Business Tax")

manufacturers_revenue_account = Accounting::Revenue.find_by(name: 'Business Tax - Manufacturers, assemblers, etc.')
wholesalers_revenue_account   = Accounting::Revenue.find_by(name: 'Business Tax - Wholesalers, distributors, etc.')
retailers_revenue_account     = Accounting::Revenue.find_by(name: 'Business Tax - Retailers')
contractors_revenue_account   = Accounting::Revenue.find_by(name: 'Business Tax - Contractors and Independent Contractors')
banks_revenue_account         = Accounting::Revenue.find_by(name: 'Business Tax - Banks and Other Financial Institutions')
peddlers_revenue_account      = Accounting::Revenue.find_by(name: 'Business Tax - Peddlers')
services_revenue_account      = Accounting::Revenue.find_by(name: 'Business Tax - Businesses consisting essentially of sales of services')

manufacturers = BusinessTaxCategory.find_or_create_by!(
  locality: locality,
  title: "Manufacturers, assemblers, re-packers, processors, brewers, distillers, rectifiers, and compounders of liquors, distilled spirits, and wines or manufacturers of any article of commerce of whatever kind in nature",
  revenue_account: manufacturers_revenue_account,
  discount_account: discount_account
  )

manufacturers.gross_sales_tax_ranges.find_or_create_by!(
  locality: locality,
  minimum_gross_sale: 0.01,
  maximum_gross_sale: 9_999.99,
  tax_amount: 181.50,
  tax_type: 'amount')
manufacturers.gross_sales_tax_ranges.find_or_create_by!(
  locality: locality,
  minimum_gross_sale: 10_000,
  maximum_gross_sale: 14_999.99,
  tax_amount: 242, tax_type: 'amount')
manufacturers.gross_sales_tax_ranges.find_or_create_by!(
  locality: locality,
  minimum_gross_sale: 15_000,
  maximum_gross_sale: 19_999.99,
  tax_amount: 332.20,
  tax_type: 'amount')
manufacturers.gross_sales_tax_ranges.find_or_create_by!(
  locality: locality,
  minimum_gross_sale: 20_000,
  maximum_gross_sale: 29_999.99,
  tax_amount: 484,
  tax_type: 'amount')
manufacturers.gross_sales_tax_ranges.find_or_create_by!(
  locality: locality,
  minimum_gross_sale: 30_000,
  maximum_gross_sale: 39_999.99,
  tax_amount: 726,
  tax_type: 'amount')
manufacturers.gross_sales_tax_ranges.find_or_create_by!(
  locality: locality,
  minimum_gross_sale: 40_000,
  maximum_gross_sale: 49_999.99,
  tax_amount: 907.50,
  tax_type: 'amount')
manufacturers.gross_sales_tax_ranges.find_or_create_by!(
  locality: locality,
  minimum_gross_sale: 50_000,
  maximum_gross_sale: 74_999.99,
  tax_amount: 1452, tax_type: 'amount')
manufacturers.gross_sales_tax_ranges.find_or_create_by!(
  locality: locality,
  minimum_gross_sale: 75_000,
  maximum_gross_sale: 99_999.99,
  tax_amount: 1815, tax_type: 'amount')
manufacturers.gross_sales_tax_ranges.find_or_create_by!(
  locality: locality,
  minimum_gross_sale: 100_000,
  maximum_gross_sale: 149_999.99,
  tax_amount: 2420, tax_type: 'amount')
manufacturers.gross_sales_tax_ranges.find_or_create_by!(
  locality: locality,
  minimum_gross_sale: 150_000,
  maximum_gross_sale: 199_999.99,
  tax_amount: 3025, tax_type: 'amount')
manufacturers.gross_sales_tax_ranges.find_or_create_by!(
  locality: locality,
  minimum_gross_sale: 200_000,
  maximum_gross_sale: 299_999.99,
  tax_amount: 4235, tax_type: 'amount')
manufacturers.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 300_000, maximum_gross_sale: 499_999.99, tax_amount: 6050, tax_type: 'amount')
manufacturers.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 500_000, maximum_gross_sale: 749_999.99, tax_amount: 8800, tax_type: 'amount')
manufacturers.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 750_000, maximum_gross_sale: 999_999.99, tax_amount: 11000, tax_type: 'amount')
manufacturers.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 1_000_000, maximum_gross_sale: 1_999_999.99, tax_amount: 15125, tax_type: 'amount')
manufacturers.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 2_000_000, maximum_gross_sale: 2_999_999.99, tax_amount: 18150, tax_type: 'amount')
manufacturers.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 3_000_000, maximum_gross_sale: 3_999_999.99, tax_amount: 21780, tax_type: 'amount')
manufacturers.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 4_000_000, maximum_gross_sale: 4_999_999.99, tax_amount: 25410, tax_type: 'amount')
manufacturers.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 5_000_000, maximum_gross_sale: 6_499_999.99, tax_amount: 26812.50, tax_type: 'amount')
manufacturers.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 5_000_000, maximum_gross_sale: 6_499_999.99, tax_amount: 26812.50, tax_type: 'amount')
manufacturers.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 6_500_000, maximum_gross_sale: 999_999_999_999_999.99, tax_rate: 0.00375, tax_type: 'percentage')



category_2 = BusinessTaxCategory.find_or_create_by!(
  locality: locality,
  title: "Wholesalers, distributors, or dealers of any article of commerce of whatever kind or nature",
  revenue_account: wholesalers_revenue_account,
  discount_account: discount_account)

category_2.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 0.01, maximum_gross_sale: 999.99, tax_amount: 19.80,  tax_type: 'amount')
category_2.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 1_000, maximum_gross_sale: 1_999.99, tax_amount: 36.30,  tax_type: 'amount')
category_2.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 2_000, maximum_gross_sale: 2_999.99, tax_amount: 55,  tax_type: 'amount')
category_2.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 3_000, maximum_gross_sale: 3_999.99, tax_amount: 79.20,  tax_type: 'amount')
category_2.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 4_000, maximum_gross_sale: 4_999.99, tax_amount: 110,  tax_type: 'amount')
category_2.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 5_000, maximum_gross_sale: 5_999.99, tax_amount: 133.10,  tax_type: 'amount')
category_2.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 6_000, maximum_gross_sale: 6_999.99, tax_amount: 157.30,  tax_type: 'amount')
category_2.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 7_000, maximum_gross_sale: 7_999.99, tax_amount: 181.50,  tax_type: 'amount')
category_2.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 8_000, maximum_gross_sale: 9_999.99, tax_amount: 205.70,  tax_type: 'amount')
category_2.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 10_000, maximum_gross_sale: 14_999.99, tax_amount: 242,  tax_type: 'amount')
category_2.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 15_000, maximum_gross_sale: 19_999.99, tax_amount: 302.50,  tax_type: 'amount')
category_2.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 20_000, maximum_gross_sale: 29_999.99, tax_amount: 363,  tax_type: 'amount')
category_2.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 30_000, maximum_gross_sale: 39_999.99, tax_amount: 484,  tax_type: 'amount')
category_2.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 40_000, maximum_gross_sale: 49_999.99, tax_amount: 726,  tax_type: 'amount')
category_2.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 50_000, maximum_gross_sale: 74_999.99, tax_amount: 1089,  tax_type: 'amount')
category_2.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 75_000, maximum_gross_sale: 99_999.99, tax_amount: 1452,  tax_type: 'amount')
category_2.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 100_000, maximum_gross_sale: 149_999.99, tax_amount: 2057,  tax_type: 'amount')
category_2.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 150_000, maximum_gross_sale: 199_999.99, tax_amount: 2662,  tax_type: 'amount')
category_2.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 200_000, maximum_gross_sale: 299_999.99, tax_amount: 3630,  tax_type: 'amount')
category_2.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 300_000, maximum_gross_sale: 499_999.99, tax_amount: 4840,  tax_type: 'amount')
category_2.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 500_000, maximum_gross_sale: 749_999.99, tax_amount: 7260,  tax_type: 'amount')
category_2.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 750_000, maximum_gross_sale: 999_999.99, tax_amount: 9680,  tax_type: 'amount')
category_2.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 1_000_000, maximum_gross_sale: 1_999_999.99, tax_amount: 11000,  tax_type: 'amount')
category_2.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 2_000_000, maximum_gross_sale: 999_999_999_999_999.99, tax_rate: 0.005,  tax_type: 'percentage')


category_3 = BusinessTaxCategory.find_or_create_by!(
  locality: locality,
  title: 'Contractors and Other Independent Contractors',
  revenue_account: contractors_revenue_account,
  discount_account: discount_account)

category_3.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 0.1, maximum_gross_sale: 4_999.99, tax_amount: 30.25,tax_type: 'amount')
category_3.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 5_000, maximum_gross_sale: 9_999.99, tax_amount: 67.65, tax_type: 'amount')
category_3.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 10_000, maximum_gross_sale: 14_999.99, tax_amount: 114.95, tax_type: 'amount')
category_3.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 15_000, maximum_gross_sale: 19_999.99, tax_amount: 181.50, tax_type: 'amount')
category_3.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 20_000, maximum_gross_sale: 29_999.99, tax_amount: 302.50, tax_type: 'amount')
category_3.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 30_000, maximum_gross_sale: 39_999.99, tax_amount: 423.50, tax_type: 'amount')
category_3.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 50_000, maximum_gross_sale: 74_999.99, tax_amount: 968, tax_type: 'amount')
category_3.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 75_000, maximum_gross_sale: 99_999.99, tax_amount: 1452, tax_type: 'amount')
category_3.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 40_000, maximum_gross_sale: 49_999.99, tax_amount: 605, tax_type: 'amount')
category_3.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 100_000, maximum_gross_sale: 149_999.99, tax_amount: 2178, tax_type: 'amount')
category_3.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 150_000, maximum_gross_sale: 199_999.99, tax_amount: 2904, tax_type: 'amount')
category_3.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 200_000, maximum_gross_sale: 249_999.99, tax_amount: 3993, tax_type: 'amount')
category_3.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 250_000, maximum_gross_sale: 299_999.99, tax_amount: 5082, tax_type: 'amount')
category_3.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 300_000, maximum_gross_sale: 399_999.99, tax_amount: 6776, tax_type: 'amount')
category_3.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 400_000, maximum_gross_sale: 499_999.99, tax_amount: 9075, tax_type: 'amount')
category_3.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 500_000, maximum_gross_sale: 749_999.99, tax_amount: 10175, tax_type: 'amount')
category_3.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 750_000, maximum_gross_sale: 999_999.99, tax_amount: 11275, tax_type: 'amount')
category_3.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 1_000_000, maximum_gross_sale: 1_999_999.99, tax_amount: 12650, tax_type: 'amount')
category_3.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 2_000_000, maximum_gross_sale: 999_999_999_999_999.99, tax_rate: 0.005,  tax_type: 'percentage', minimum_tax_amount: 13_800)

category_4 = BusinessTaxCategory.find_or_create_by!(
  locality: locality,
  title: "Business hereunder enumerated: Cafes, cafeterias,
  ice cream and other refreshment parlors, restaurants,
  soda fountain bars, carinderias or food caterers;
  Commission agents; Lessors, dealers, brokers of real estate;
  On travel agencies and travel agents; Boarding houses, motels, apartments,
  and condominiums;
  Subdivision owners/Private Cemeteries and Memorial Parks; Hospitals,
  medical/dental/therapeutic clinics, medical/dental laboratories;
  Operators of Cable Network System;
  Operators of computer services establishments; General consultancy services;
  All other similar activities consisting essentially of the sales of services for a fee.",
  revenue_account: services_revenue_account,
  discount_account: discount_account
  )
#
category_4.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 0.1, maximum_gross_sale: 4_999.99, tax_amount: 30.25,tax_type: 'amount')
category_4.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 5_000, maximum_gross_sale: 9_999.99, tax_amount: 67.65, tax_type: 'amount')
category_4.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 10_000, maximum_gross_sale: 14_999.99, tax_amount: 114.95, tax_type: 'amount')
category_4.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 15_000, maximum_gross_sale: 19_999.99, tax_amount: 181.50, tax_type: 'amount')
category_4.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 20_000, maximum_gross_sale: 29_999.99, tax_amount: 302.50, tax_type: 'amount')
category_4.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 30_000, maximum_gross_sale: 39_999.99, tax_amount: 423.50, tax_type: 'amount')
category_4.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 50_000, maximum_gross_sale: 74_999.99, tax_amount: 968, tax_type: 'amount')
category_4.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 75_000, maximum_gross_sale: 99_999.99, tax_amount: 1452, tax_type: 'amount')
category_4.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 40_000, maximum_gross_sale: 49_999.99, tax_amount: 605, tax_type: 'amount')
category_4.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 100_000, maximum_gross_sale: 149_999.99, tax_amount: 2178, tax_type: 'amount')
category_4.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 150_000, maximum_gross_sale: 199_999.99, tax_amount: 2904, tax_type: 'amount')
category_4.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 200_000, maximum_gross_sale: 249_999.99, tax_amount: 3993, tax_type: 'amount')
category_4.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 250_000, maximum_gross_sale: 299_999.99, tax_amount: 5082, tax_type: 'amount')
category_4.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 300_000, maximum_gross_sale: 399_999.99, tax_amount: 6776, tax_type: 'amount')
category_4.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 400_000, maximum_gross_sale: 499_999.99, tax_amount: 9075, tax_type: 'amount')
category_4.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 500_000, maximum_gross_sale: 749_999.99, tax_amount: 10175, tax_type: 'amount')
category_4.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 750_000, maximum_gross_sale: 999_999.99, tax_amount: 11275, tax_type: 'amount')
category_4.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 1_000_000, maximum_gross_sale: 1_999_999.99, tax_amount: 12650, tax_type: 'amount')
category_4.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 2_000_000, maximum_gross_sale: 999_999_999_999_999.99, tax_rate: 0.005,  tax_type: 'percentage', minimum_tax_amount: 13_800)

category_5 = BusinessTaxCategory.find_or_create_by!(
  locality: locality,
  title: "Banks and other financial institutions",
  revenue_account: banks_revenue_account,
  discount_account: discount_account)
category_5.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 1, maximum_gross_sale: 999_999_999_999_999.99, tax_rate: 0.005,  tax_type: 'percentage')

category_6 = BusinessTaxCategory.find_or_create_by!(
  locality: locality, title: "Peddlers",
  revenue_account: peddlers_revenue_account,
  discount_account: discount_account
  )
category_6.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 1, maximum_gross_sale: 999_999_999_999_999.99, tax_amount: 55,  tax_type: 'amount')

category_7 = BusinessTaxCategory.find_or_create_by!(
  locality: locality,
  title: "Retailers",
  revenue_account: retailers_revenue_account,
  discount_account: discount_account)
category_7.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 0.1, maximum_gross_sale: 400_000, tax_rate: 0.02,  tax_type: 'percentage')
category_7.gross_sales_tax_ranges.find_or_create_by!(locality: locality, minimum_gross_sale: 400_001, maximum_gross_sale: 999_999_999_999_999.99, gross_limit: 400_000, tax_rate: 0.02, tax_rate_for_excess: 0.01, tax_type: 'percentage_with_tax_on_excess')
