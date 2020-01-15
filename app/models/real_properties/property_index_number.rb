module RealProperties
  class PropertyIndexNumber < ApplicationRecord
    belongs_to :property, polymorphic: true
  end
end 