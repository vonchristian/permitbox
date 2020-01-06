module BusinessRegistration
  class SubmissionProcessing
    include ActiveModel::Model
    attr_accessor :cart_id, :locality_id

    def process!
      ActiveRecord::Base.transaction do
        create_submission
      end
    end

    private
    def create_submission
      business = Business.create!(
        business_number: Business.count.succ,
        locality_id: locality_id,
        account_number: SecureRandom.uuid,
        name: find_cart.name,
        ownership_type_id: find_cart.ownership_type_id,
        business_tax_category_id: find_cart.business_tax_category_id
        )
      create_owner(business)
      create_area_measurement(business)
      create_capital(business)
      create_location(business)
      create_asset_size(business)
      create_business_activities(business)
      create_charges(business)
      send_email
      create_required_documents(business)

      destroy_cart
    end

    def create_owner(business)
      Ownership.create!(ownable: business, owner: find_cart.taxpayer)
    end

    def create_area_measurement(business)
      establishment = business.establishments.create()
      establishment.area_measurements << find_cart.area_measurements
    end
    def create_capital(business)
      capital = Businesses::BusinessCapital.create!(
        business: business,
        capital_amount: find_cart.capital,
        date: Date.today.last_year)
    end
    def create_location(business)
      business.locations << find_cart.locations
    end
    def create_asset_size(business)
      Businesses::AssetSize.create!(
      enterprise_scale_id: EnterpriseScale.all.select{ |a| a.range.cover?(find_cart.asset_size.to_f) }.first.try(:id),
      business: business,
      asset_size: find_cart.asset_size)
    end
    def create_business_activities(business)
      find_cart.line_of_businesses.each do |line_of_business|
        business.business_activities.find_or_create_by!(
          quantity: 1,
          line_of_business: line_of_business)
      end
    end

    def create_charges(business)
      business.charges << find_cart.charges
      business.voucher_amounts << find_cart.voucher_amounts
    end


    def find_cart
      Cart.find(cart_id)
    end
    def find_locality
      Locations::Locality.find(locality_id)
    end
    def send_email
    end

    def destroy_cart
      Cart.find_by_id(cart_id).destroy
    end

    def create_required_documents(business)
      business.documents << find_cart.documents
      business.required_documents.each do |required_document|
        required_document.applications.find_or_create_by(date: Date.today, applicant: business)
      end
    end
  end
end
