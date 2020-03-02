class TinPlate < ApplicationRecord
  belongs_to :tin_platable, polymorphic: true
  belongs_to :locality
end
