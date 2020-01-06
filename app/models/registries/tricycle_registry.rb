module Registries
  class TricycleRegistry < Registry
    def parse_for_records(file)
      xlsx = Roo::Spreadsheet.open(file)
      header = xlsx.row(2)
      (3..xlsx.last_row).each do |i|
        row = Hash[[header, xlsx.row(i)].transpose]
        upload_tricycle(row)
      end
    end

    private
    def upload_tricycle(row)
      tricycle = Tricycle.create!(
        plate_number:          row["Plate Number"],
        mtop_number:           row["MTOP Number"],
        tricycle_organization: find_tricycle_organization(row),
        locality:              find_locality(row),
        tricycle_type:         tricycle_type(row)
      )
      create_ownerships(tricycle, row)
      create_location(tricycle, row)
    end

    def create_ownerships(tricycle, row)
      taxpayer = find_locality(row).taxpayers.find_or_create_by(
        last_name:   row["Last Name"],
        middle_name: row["Middle Name"],
        first_name:  row["First Name"]
      )
      Ownership.find_or_create_by(
        ownable: tricycle,
        owner: taxpayer)
    end

    def create_location(tricycle, row)
      Location.create!(
        complete_address: row["Complete Address"],
        locationable:     tricycle,
        barangay:         find_barangay(row),
        locality:         find_locality(row),
        province:         find_province(row)
      )
    end

    def find_barangay(row)
      find_locality(row).barangays.find_by(name: row["Barangay"])
    end
    def find_locality(row)
      Locations::Locality.find_by(name: row["Locality"])
    end
    def find_province(row)
      Locations::Province.find_by(name: row["Province"])
    end

    def find_tricycle_organization(row)
      find_locality(row).tricycle_organizations.find_or_create_by(name: row["Tricycle Organization"])
    end


    def tricycle_type(row)
      if row["Tricycle Type"]== "renewed"
        "old_tricycle"
      else
        row["Tricycle Type"]
      end
    end
  end
end
