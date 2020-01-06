module Locationable
  extend ActiveSupport::Concern
  included do
    has_many :locations, as: :locationable

    delegate :details, :complete_address, :barangay_name, :street_name, to: :current_location, prefix: true, allow_nil: true
  end

  def current_location
    locations.current
  end
end
