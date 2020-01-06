module Businesses
  class Closing
    include ActiveModel::Model
    attr_accessor :business_id, :closed_at

    validates :business_id, :closed_at, presence: true

    def process!
      find_business.update_attributes!(closed_at: closed_at)
    end

    def find_business
      Business.find(business_id)
    end
  end
end
