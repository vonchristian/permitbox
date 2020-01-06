module Locations
  class Region < ApplicationRecord
    has_many :provinces

    validates :name, presence: :true
  end
end
