locality = Locations::Locality.municipality.find_by(name: "Lamut")

services = CompetetiveIndexCategory.find_or_create_by!(name: "Services")
agricultural = CompetetiveIndexCategory.find_or_create_by!(name: "Agricultural")
industrial = CompetetiveIndexCategory.find_or_create_by!(name: "Industry")

revenue_account = Accounting::Account.find_by(name: "Permit Fees")

manufacturers = LineOfBusinessCategory.find_or_create_by!(
  locality: locality,
  revenue_account: revenue_account,
  title: "Manufacturers, importers or producers of any article of commerce of whatever kind or nature, including brewers, distillers, rectifiers and re-packers, and compounders of liquors, distilled spirits and/or wines and others")

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: manufacturers,
  name: "Brewers/Compounders, distillers of liquors, distilled spirits and/or wines",
  fee_amount: 660,
  competetive_index_category: industrial)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: manufacturers,
  name: "Brewers of Fermented Liquors (Tuba, Basi,Tapuy, Bugnay)",
  fee_amount: 660,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: manufacturers,
  name: "Importers of liquors, distilled spirits and/or wines",
  fee_amount: 660,
  competetive_index_category: industrial)

agricultural_products = LineOfBusinessCategory.find_or_create_by!(
  locality: locality,
  revenue_account: revenue_account,
  title: "Agricultural Products/Implements")

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products, name: "Agricultural Inputs/Implements - Retail",
  fee_amount: 440,
  competetive_index_category: agricultural)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: "Agricultural Inputs/Implements - Wholesale",
  fee_amount: 1000,
  competetive_index_category: agricultural)

LineOfBusiness.find_or_create_by!(
locality: locality,
line_of_business_category: agricultural_products,
name: 'Betel nut("Taluwan") - Retail',
fee_amount: 100,
competetive_index_category: agricultural)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Betel nut("Taluwan") - Wholesale',
  fee_amount: 250,
  competetive_index_category: agricultural)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Dressed chicken - Retail',
  fee_amount: 350,
  competetive_index_category: agricultural)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Fingerling producers/Distributor - Retail', fee_amount: 350,
  competetive_index_category: agricultural)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Fingerling producers/Distributor - Wholesale',
  fee_amount: 500,
  competetive_index_category: agricultural)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Fish (fresh) - Retailer',
  fee_amount: 330,
  competetive_index_category: agricultural)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Fish (fresh) - Wholesaler', fee_amount: 1100,
  competetive_index_category: agricultural)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Fish (Smoked or Dried) - Retailer',
  fee_amount: 210,
  competetive_index_category: agricultural)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Fish (Smoked or Dried) - Wholesaler',
  fee_amount: 500,
  competetive_index_category: agricultural)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Fishery', fee_amount: 210,
  competetive_index_category: agricultural)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Flower/Ornamental Plants/Fruit Trees - Retailer',
  fee_amount: 330, competetive_index_category: agricultural)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Flower/Ornamental Plants/Fruit Trees - Wholesaler',
  fee_amount: 500,
  competetive_index_category: agricultural)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Frozen Foods - Retailer', fee_amount: 350,
  competetive_index_category: agricultural)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Frozen Foods - Wholesaler',
  fee_amount: 500,
  competetive_index_category: agricultural)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Fruits/Vegetables Buyer - Wholesaler',
  fee_amount: 1000,
  competetive_index_category: agricultural)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Fruits/Vegetables Buyer - Retailer',
  fee_amount: 350,
  competetive_index_category: agricultural)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Livestock Buy and Sell',
  fee_amount: 1000,
  competetive_index_category: agricultural)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Meat Retailer',
  fee_amount: 385,
  competetive_index_category: agricultural)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Piggery (Commercial 10-20 heads)',
  fee_amount: 1000, competetive_index_category: agricultural)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Piggery (Commercial 21-30 heads)',
  fee_amount: 1500,
  competetive_index_category: agricultural)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Piggery (Commercial 31-or more heads)',
  fee_amount:  2000,
  competetive_index_category: agricultural)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Poultry/Broiler Raisers and Layers (Non Contract) 500 Heads and above',
  fee_amount: 1500,
  competetive_index_category: agricultural)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Poultry/Contract Growers (below 6,000 heads)',
  fee_amount: 1000,
  competetive_index_category: agricultural)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Poultry/Contract Growers (6,000 to 10000 heads)',
  fee_amount: 1500,
  competetive_index_category: agricultural)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Poultry/Contract Growers (10000 to 20000 heads)',
  fee_amount: 2000,
  competetive_index_category: agricultural)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Poultry/Contract Growers (20000 or more heads)',
  fee_amount: 3000,
  competetive_index_category: agricultural)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Poultry Eggs - Retailer',
  fee_amount: 220,
  competetive_index_category: agricultural)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Poultry Eggs - Wholesaler',
  fee_amount: 1000,
  competetive_index_category: agricultural)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Poultry Retailers (Live)',
  fee_amount: 2200,
  competetive_index_category: agricultural)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Rice/Corn Retailer',
  fee_amount: 4400,
  competetive_index_category: agricultural)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Roasted Chicken Retailer',
  fee_amount: 330,
  competetive_index_category: agricultural)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Roasted Pig Retailer',
  fee_amount: 500,
  competetive_index_category: agricultural)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Tobacco Retailer',
  fee_amount: 210,
  competetive_index_category: agricultural)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Vegetable/Fruit/ and Root Crops Retailer',
  fee_amount: 210,
  competetive_index_category: agricultural)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agricultural_products,
  name: 'Veterinary Supply',
  fee_amount: 400,
  competetive_index_category: agricultural)


agro_industrial = LineOfBusinessCategory.find_or_create_by!(
  locality: locality,
  revenue_account: revenue_account,
  title: "Agro-Industrial Machinery / Heavy Equipment or non-resident operators renting said machinery / equipment in this municipality")

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agro_industrial,
  name: "Backhoe",
  fee_amount: 330,
  competetive_index_category: services)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agro_industrial,
  name: "Batching Plant",
  fee_amount: 220,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agro_industrial,
  name: "Bulldozer",
  fee_amount: 330, competetive_index_category: services)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agro_industrial,
  name: "Chainsaw",
  fee_amount: 330,
  competetive_index_category: services)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agro_industrial,
  name: "Forklift",
  fee_amount: 330,
  competetive_index_category: services)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agro_industrial,
  name: "Grader, Heavy",
  fee_amount: 330, competetive_index_category: services)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agro_industrial,
  name: "Grader, Light",
  fee_amount: 220,
  competetive_index_category: services)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agro_industrial,
  name: "Mixer, Manual",
  fee_amount:150,
  competetive_index_category: services)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agro_industrial,
  name: "Pay Loader",
  fee_amount: 220,
  competetive_index_category: services)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agro_industrial,
  name: "Prime Mover / Flatbed",
  fee_amount: 220 ,
  competetive_index_category: services)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agro_industrial,
  name: "Rock Crusher",
  fee_amount: 220 ,
  competetive_index_category: services)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agro_industrial,
  name: "Thresher, Manual",
  fee_amount: 165,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agro_industrial,
  name: "Thresher, Mechanized",
  fee_amount: 220 ,
  competetive_index_category: services)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agro_industrial,
  name: "Tractor, Hand",
  fee_amount: 220 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agro_industrial,
  name: "Tractor, Heavy",
  fee_amount: 330,
  competetive_index_category: services)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agro_industrial,
  name: "Tractor, Light",
  fee_amount: 220,
  competetive_index_category: services)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agro_industrial,
  name: "Truck, Cargo",
  fee_amount: 220,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agro_industrial,
  name: "Truck, Dump",
  fee_amount:220,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agro_industrial,
  name: "Truck, Transit Mixer",
  fee_amount: 165 ,
  competetive_index_category: services)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: agro_industrial,
  name: "Other Agricultural Machineries or heavy equipment",
  fee_amount: 220,
  competetive_index_category: services)

industrial_category = LineOfBusinessCategory.find_or_create_by(
  locality: locality,
  revenue_account: revenue_account,
  title: "Industrial")

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: industrial_category,
  name: "Appliance Repair Shop",
  fee_amount: 396,
  competetive_index_category: industrial)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: industrial_category,
  name: "Auto Repair Shop",
  fee_amount: 500,
  competetive_index_category: industrial)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: industrial_category,
  name: "Blacksmiths / Goldsmiths",
  fee_amount: 495,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: industrial_category,
  name: "Cellphone Repair Shop",
  fee_amount: 330,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: industrial_category,
  name: "Cellphone Shop",
  fee_amount: 330,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: industrial_category,
  name: "Chainsaw Repair Shop",
  fee_amount: 330,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: industrial_category,
  name: "Computer Shop",
  fee_amount: 400,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: industrial_category,
  name: "Computer Supplies / Repair Shop",
  fee_amount: 400,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: industrial_category,
  name: "Electronic Repair Shop",
  fee_amount: 220,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: industrial_category,
  name: "Hollow Block Makers",
  fee_amount: 750,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: industrial_category,
  name: "Junk buyers (Ambulant)",
  fee_amount: 100,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: industrial_category,
  name: "Junk Shop (Stationary)",
  fee_amount: 330,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: industrial_category,
  name: "Meat/Fish/Fruit Processing",
  fee_amount: 330,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: industrial_category,
  name: "Motor Repair Shop",
  fee_amount: 330,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: industrial_category,
  name: "Multipurpose Food Grinders",
  fee_amount: 220,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: industrial_category,
  name: "Palay/Corn/Coffee Millers",
  fee_amount: 440,
  competetive_index_category: agricultural)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: industrial_category,
  name: "Sand and Gravel/Boulders/Earth Fill",
  fee_amount: 1100,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: industrial_category,
  name: "Sash and Furniture Shop",
  fee_amount: 1320 ,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: industrial_category,
  name: "Signage, Billboard, Tarpaulin Makers",
  fee_amount: 220,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: industrial_category,
  name: "Vehicle and Motor Side Car Assembler",
  fee_amount: 1000,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: industrial_category,
  name: "Vendo/Dispensing Machines",
  fee_amount: 200,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: industrial_category,
  name: "Vulcanizing Shop",
  fee_amount: 330,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: industrial_category,
  name: "Water Station",
  fee_amount: 550 ,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: industrial_category,
  name: "Woodcarving Shop and Other Forest Products",
  fee_amount: 660,
  competetive_index_category: industrial)

eating_places = LineOfBusinessCategory.find_or_create_by!(
  locality: locality,
  revenue_account: revenue_account,
  title: "Eating Places")

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: eating_places,
  name: "Balot/Barbecue Stand",
  fee_amount: 110,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: eating_places,
  name: "Buko/Palamig Stand",
  fee_amount: 110,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: eating_places,
  name: "Burger Stand",
  fee_amount: 330,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: eating_places,
  name: "Cafes/Cafeteria",
  fee_amount: 330,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: eating_places,
  name: "Ice Cream Stand",
  fee_amount: 110,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: eating_places,
  name: "Restaurant",
  fee_amount: 440 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: eating_places,
  name: "Snack House",
  fee_amount: 330,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: eating_places,
  name: "Other Business of the same nature",
  fee_amount: 330,
  competetive_index_category: services)

commercial_businesses =  LineOfBusinessCategory.find_or_create_by!(
  locality: locality,
  revenue_account: revenue_account,
  title: "Commercial Businesses")

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Motorcycle/Bicycle Spare Parts",
  fee_amount: 600,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Auto Spare Parts",
  fee_amount: 1000,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Motor Oil/Lubricants",
  fee_amount: 200,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Bakery(Retailer)",
  fee_amount: 440,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Bakery(Wholesaler)",
  fee_amount: 800,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Buy and Sell of Rice/Corn/Coffee Grains",
  fee_amount: 1000 ,
  competetive_index_category: agricultural)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "CATV/Telephone/Radio Stations",
  fee_amount: 1320,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Cell Site",
  fee_amount: 5500 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Charcoal",
  fee_amount: 231,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Cigarette(Retailer)",
  fee_amount: 300,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Cigarette(Wholesaler)",
  fee_amount: 1000,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Dry Goods(Retailer)",
  fee_amount: 440,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Dry Goods(Wholesaler)",
  fee_amount: 1000,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Foot Wear(Retailer)",
  fee_amount: 440,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Foot Wear(Wholesaler)",
  fee_amount: 500,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Gasoline Station",
  has_storage_permit_fee: true,
  fee_amount: 880 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Grocery Store", fee_amount: 440,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Hardware Supplies",
  fee_amount: 660,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Ice Blocks",
  fee_amount: 231 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Liquor(Retailer)",
  fee_amount: 500,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Liquor(Wholesaler)",
  fee_amount: 1000,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "LPG(Retailer)",
  fee_amount: 330,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "LPG(Wholesaler)",
  fee_amount: 1000,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Newspapers, magazines, etc.",
  fee_amount: 231 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Pharmaceutical Distributor",
  fee_amount: 1000 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Pharmacy",
  fee_amount: 440,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Phone Cards(E-Load/Auto Load)",
  fee_amount: 220,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Plastic Wares",
  fee_amount: 440,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Business Establishment Rental(Private Buildings) Office/Business Establsihments 1-3 rooms/space",
  fee_amount: 1500 ,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Business Establishment Rental(Private Buildings) Office/Business Establsihments 4 and above rooms/space",
  fee_amount: 2500,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "RTW (Including used clothing)",
  fee_amount: 400 ,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Sales Center of Motorcycles",
  fee_amount: 1500,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Sales Center of Cars",
  fee_amount: 3000 ,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Sales Center of Light/Heavy Equipment",
  fee_amount: 4000 ,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Sales Center of Appliances",
  fee_amount: 1000,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Sari-Sari Store",
  fee_amount: 231,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "School/Office Supplies",
  fee_amount: 330 ,competetive_index_category: industrial)

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: commercial_businesses,
  name: "Others(Commercial Businesses)",
  fee_amount: 231,
  competetive_index_category: industrial)

services_category = LineOfBusinessCategory.find_or_create_by!(
  locality: locality,
  revenue_account: revenue_account,
  title: "Services")
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Accounting Services",
  fee_amount: 500,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Animal Inseminators",
  fee_amount: 495 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Automated Teller Machines(ATM) of banks/per machine",
  fee_amount: 200,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Beauticians(Ambulant)",
  fee_amount: 220,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Beauty Parlors",
  fee_amount: 330,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Boarding House(Class A)",
  fee_amount: 1000,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Boarding House(Class B)",
  fee_amount: 800 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Boarding House(Class C)",
  fee_amount: 500 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Boarding House(Class D)",
  fee_amount: 300 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Butchers",
  fee_amount: 231 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Cargo/Baggage Handlers",
  fee_amount: 110 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Construction/Repair Shop of Animal-drawn Vehicles, Bicycles, Tricycles, Sidecar",
  fee_amount: 330 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Construction/Repair Shop of Bodies of Motor Vehicles",
  fee_amount: 660 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Consultants (Other Consultancy Services)",
  fee_amount: 1200 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Courier Services",
  fee_amount: 231 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Diagnostic Laboratory Center",
  fee_amount: 600 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Drug Testing Center",
  fee_amount: 330 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Film-making/Movie Production Center",
  fee_amount: 1500,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Fitness Center",
  fee_amount: 500,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Fruit Tree Sprayers(for blooming purposes)",
  fee_amount: 330 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Funeral Parlor",
  fee_amount: 880 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "General Engineering, Building and Specialty Contractors",
  fee_amount: 3300 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Haulers(Private)",
  fee_amount: 3000 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Haulers(Private) - Scrap/Junk Materials",
  fee_amount: 1000 , competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Haulers(Private) - Fruits/Vegetables",
  fee_amount: 500,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Haulers(Private) - Feeds(Non-commercial)",
  fee_amount: 1500 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Haulers(Private) - Chickens(Chicks/Culls)",
  fee_amount: 500 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Haulers(Private) - Chickens(Broilers)",
  fee_amount: 1500 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Haulers(Private) - Forest Products(Charcoal)",
  fee_amount: 500 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Haulers(Private) - Forest Products(Wood Carvings)",
  fee_amount: 1000 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Haulers(Private) - Sand and Gravel(Commercial/Projects)",
  fee_amount: 1500 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Hotel/Lodging House/Motels",
  fee_amount: 1320 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "House and/or Sign Painters",
  fee_amount: 165 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Lathe Machine Shop",
  fee_amount: 660 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Laundry Shops",
  fee_amount: 300 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Learning Centers(Private) - Nursery and Kinder",
  fee_amount: 1000,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Learning Centers(Private) - Primary and Elementary",
  fee_amount: 1000,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Learning Centers(Private) - Secondary",
  fee_amount: 1000 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Learning Centers(Private) - Tertiary/Vocational",
  fee_amount: 1000 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Lotto Operators",
  fee_amount: 1100 , competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Manpower/Notarial/Legal/Surveying Services",
  fee_amount: 1320 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Massage Clinic",
  fee_amount: 500 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Medical/Dental/Optical Clinic",
  fee_amount: 440 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Person engaged in installation of Water System",
  fee_amount: 231 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Person engaged in installation of Electricity/Electronics",
  fee_amount: 231 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Photocopy Machine (per unit)",
  fee_amount: 100 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Photographic Studios",
  fee_amount: 231 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Photo static, White/Blue Printing",
  fee_amount: 231 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Plastic Lamination (per unit)",
  fee_amount: 100 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Printing House/Press",
  fee_amount: 500 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Realtors",
  fee_amount: 440 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Rent-a-car/van/jeepneys",
  fee_amount: 500 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Review Centers",
  fee_amount: 1000 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Seminar, Training, and Other Teaching Services (Private)",
  fee_amount: 300 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Shoe Repair Shop",
  fee_amount: 220 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Sound System Rental",
  fee_amount: 385 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Tailoring/Dress Shop",
  fee_amount: 495 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Travel Agency",
  fee_amount: 500 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Upholstery Shop",
  fee_amount: 440 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Veterinary Clinic/Pet Shop",
  fee_amount: 1320,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Watch Repair Shop",
  fee_amount: 330,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: services_category,
  name: "Others(Services)",
  fee_amount: 231,
  competetive_index_category: services)

recreational_category = LineOfBusinessCategory.find_or_create_by!(
  locality: locality,
  revenue_account: revenue_account,
  title: "Recreational, Entertainment and Amusement Particulars")

LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: recreational_category,
  name: "Beerhouses(without karaoke/video)",
  fee_amount: 660,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: recreational_category,
  name: "Billiard Hall/Pool",
  fee_amount: 440,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: recreational_category,
  name: "Cinematographic Film/Video/Tape Owners/Lessors",
  fee_amount: 330 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: recreational_category,
  name: "Night Clubs, Sing-along Bars/Discos",
  fee_amount: 1320 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: recreational_category,
  name: "Resort Owners/Zoo Operators",
  fee_amount: 1100 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: recreational_category,
  name: "Video Games",
  fee_amount: 1100 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: recreational_category,
  name: "Videoke Machine Rentals/Unit",
  fee_amount: 300 ,
  competetive_index_category: services)

other_business_activities = LineOfBusinessCategory.find_or_create_by!(
  locality: locality,
  revenue_account: revenue_account,
  title: "Other Business Activities")
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: other_business_activities,
  name: "Banks",
  fee_amount: 1320 ,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: other_business_activities,
  name: "Insurance/Surety",
  fee_amount: 880 ,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: other_business_activities,
  name: "Micro lending from lending institution",
  fee_amount: 2000,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: other_business_activities,
  name: "Money Shop",
  fee_amount: 660,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: other_business_activities,
  name: "Pawn Shop",
  fee_amount: 660 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: other_business_activities,
  name: "Private Individual Lending",
  fee_amount: 1100 ,
  competetive_index_category: industrial)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: other_business_activities,
  name: "Underwriters/agents",
  fee_amount: 440 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: other_business_activities,
  name: "Peddlers (Ambulant)",
  fee_amount: 231 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: other_business_activities,
  name: "Peddlers (Motorized)",
  fee_amount: 495 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: other_business_activities,
  name: "Permit to Advertise Business and Profession thru Billboards, Signs, Tarpaulins",
  fee_amount: 500 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: other_business_activities,
  name: "Permit to transport large cattle",
  fee_amount: 220 ,
  competetive_index_category: services)
LineOfBusiness.find_or_create_by!(
  locality: locality,
  line_of_business_category: other_business_activities,
  name: "Others(Other Business Activities)",
  fee_amount: 231,
  competetive_index_category: services)
