module Businesses
  class Registration
    include ActiveModel::Model
    attr_accessor :business_area, :business_name, :ownership_type_id, :taxpayer_id,
    :capital, :date, :business_tax_category_id, :street, :building_number,
    :barangay_id, :street_id, :locality_id, :province_id,
    :business_asset_size, :line_of_business_ids,
    :taxpayer_first_name, :taxpayer_middle_name, :taxpayer_last_name, :account_number

    def register!
      create_business
    end


    private
    def create_business
      business = Business.create!(
        account_number: account_number,
        name: business_name,
        ownership_type_id: ownership_type_id,
        business_tax_category_id: business_tax_category_id
        )
      create_owner(business)
      create_area_measurement(business)
      create_capital(business)
      create_location(business)
      create_requirements(business)
      create_asset_size(business)
      create_business_activities(business)
    end

    def find_taxpayer
      if taxpayer_id.present?
        Taxpayer.find_by_id(taxpayer_id)
      else
        Taxpayer.find_or_create_by(
          first_name: taxpayer_first_name,
          middle_name: taxpayer_middle_name,
          last_name: taxpayer_last_name)
      end
    end

    def find_locality
      Locations::Locality.find_by_id(locality_id)
    end

    def create_owner(business)
      Ownership.create!(ownable: business, owner: find_taxpayer)
    end
    def create_area_measurement(business)
      area_measurement = AreaMeasurement.create!(measurable: business, area: business_area)
      set_sanitary_inspection_fee(area_measurement.area, business)
    end
    def create_capital(business)
      capital = Businesses::BusinessCapital.create!(business: business, capital_amount: capital, date: date)
      # charge = CapitalTaxConfig.set_charge_for(capital.amount)
      charge = Charge.create!(locality: Locations::Locality.last, name: "Capital Tax", revenue_account: find_locality.capital_tax_revenue_account, amount: 100)
      Chargeable.create(chargeable: business, charge: charge)
      Vouchers::VoucherAmount.create(name: charge.name,  amountable: business, amount: charge.amount, account: charge.revenue_account)
    end
    def set_sanitary_inspection_fee(area, business)
      charge = Configurations::SanitaryInspectionConfig.set_charge_for(area)
      Chargeable.create(chargeable: business, charge: charge)
      Vouchers::VoucherAmount.create(name: "Sanitary Inspection Fee", amountable: business, amount: charge.amount, account: charge.revenue_account)
    end
    def create_location(business)
      Location.create(
        locationable: business,
        street_id: street_id,
        barangay_id: barangay_id,
        locality_id: locality_id,
        province_id: province_id)
    end
    def find_locality
      Locations::Locality.find_by_id(locality_id)
    end

    def create_asset_size(business)
      asset_size = Businesses::AssetSize.create!(
        enterprise_scale_id: EnterpriseScale.all.select{ |a| a.range.cover?(business_asset_size.to_f) }.first.id,
        business: business,
        asset_size: asset_size)
    end

    def create_requirements(business)
      find_locality.documents.each do |document|
        business.required_documents.find_or_create_by(document: document)
      end
    end

    def create_business_activities(business)
      line_of_business_ids.reject{ |e| e.to_s.empty? }.each do |id|
        line_of_business = LineOfBusiness.find_by_id(id)
        business.business_activities.create(line_of_business: line_of_business)
        Vouchers::VoucherAmount.create(name: line_of_business.charge.name, amountable: business, amount: line_of_business.charge.amount, account: line_of_business.charge.revenue_account)
      end
    end
  end
end
