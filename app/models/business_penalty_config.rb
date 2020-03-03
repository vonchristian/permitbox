class BusinessPenaltyConfig < ApplicationRecord
  belongs_to :locality, class_name: 'Locations::Locality'
end
