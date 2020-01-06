module RealPropertyTypes
  class Machinery < ApplicationRecord
    has_many :ownerships, as: :ownable
    has_many :taxpayer_owners, through: :ownerships, source: :owner, source_type: "Taxpayer"
  end
end
