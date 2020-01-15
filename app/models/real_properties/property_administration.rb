module RealProperties 
  class PropertyAdministration < ApplicationRecord
    belongs_to :administrator, polymorphic: true
    belongs_to :property, polymorphic: true
  end
end