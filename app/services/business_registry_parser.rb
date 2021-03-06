require 'roo'
class BusinessRegistryParser
  attr_reader :spreadsheet
  def initialize(spreadsheet)
    @spreadsheet = spreadsheet
  end
  def parse_for_records
    xlsx = Roo::Spreadsheet.open(spreadsheet)
    header = xlsx.row(2)
    (3..xlsx.last_row).each do |i|
      row = Hash[[header, xlsx.row(i)].transpose]
      upload_business(row)
    end
  end

  private
  def upload_business(row)
    business = Business.find_or_create_by(
      name:                  row["Business Name"],
      business_type:         'old_business',
      mode_of_payment:       'annually',
      locality:              find_locality(row),
      ownership_type:        find_ownership_type(row),
      employee_count:        row["Employee Count"],
      business_tax_category: find_business_tax_category(row))
     
      create_business_owners(business, row)
      create_line_of_businesses(business, row)
      create_location(business, row)

  end

  def find_locality(row)
    Locations::Locality.find_by(name: row["Locality"].lstrip.rstrip )
  end

  def find_barangay(row)
    Locations::Barangay.find_by(name: row["Barangay"].lstrip.rstrip )
  end

  def find_province(row)
    Locations::Province.find_by(name: row["Province"].lstrip.rstrip)
  end

  def find_ownership_type(row)
    OwnershipType.find_by(title: row["Ownership Type"])
  end
  def find_business_tax_category(row)
    BusinessTaxCategory.find_by(title: row["Business Tax Category"])
  end
  def create_business_owners(business, row)
    taxpayer = Taxpayer.find_or_create_by(
      locality:    find_locality(row),
      last_name:   row["Last Name"],
      middle_name: row["Middle Name"],
      first_name:  row["First Name"]
    )
    business.ownerships.find_or_create_by(owner: taxpayer)
  end

  def create_location(business, row)
    business.locations.create!(
      complete_address: row["Complete Address"],
      locality: find_locality(row),
      barangay: find_barangay(row),
      province: find_province(row)
    )
    
  end
  def create_line_of_businesses(business, row)
    row["Line of Businesses"].split(',').each do |name|
      line_of_business = LineOfBusiness.find_by(name: name)
      if line_of_business
        business.business_activities.create(line_of_business: line_of_business, quantity: 1)
      end
    end
  end
end
