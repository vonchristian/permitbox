module RealProperties
  class RealPropertyArea < ApplicationRecord
    belongs_to :measureable, polymorphic: true
  end
end
