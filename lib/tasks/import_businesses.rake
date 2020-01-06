require 'spreadsheet'
namespace :import do
  task businesses: :environment do
    locality = Locations::Locality.find_by(name: "Lamut")
     filename = File.join Rails.root, "businesses.xls"
     excel = Spreadsheet.open(filename)
     sheet = excel.worksheet 0
     sheet.each 1 do |item|
        unless item.nil?
          taxpayer = Taxpayer.find_or_create_by!(
            first_name: item[0],
            middle_name: item[1],
            last_name: item[2])
          business = Business.find_or_create_by!(
            locality: locality,
            ownership_type: ownership_type(item),
            permit_status: permit_status(row),
            name: item[3])
          Location.create!(
            locationable: business,
            barangay: barangay(item),
            complete_address: complete_address(item),
            locality: Locations::Locality.find_by(name: "Lamut"),
            province: Locations::Province.find_by(name: "Ifugao"))
          Ownership.create(
            owner: taxpayer,
            ownable: business)
        end
     end

   end
end
