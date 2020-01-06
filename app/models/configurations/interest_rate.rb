module Configurations
  class InterestRate < ApplicationRecord
    belongs_to :locality, class_name: "Locations::Locality"
  end
end
