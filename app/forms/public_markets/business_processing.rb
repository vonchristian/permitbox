module PublicMarkets
  class BusinessProcessing
    include ActiveModel::Model
    attr_accessor :business_id, :public_market_id, :tenancy_type
    def process!
      add_to_market
    end
    private
    def add_to_market
      find_business.tenancies.destroy_all
      find_business.tenancies.find_or_create_by(public_market: find_market, tenancy_type: tenancy_type)
    end
    def find_market
      PublicMarket.find(public_market_id)
    end
    def find_business
      Business.find(business_id)
    end
  end
end
