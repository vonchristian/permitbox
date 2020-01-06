class PropertyIndexNumber < ApplicationRecord
  belongs_to :property, polymorphic: true
end
