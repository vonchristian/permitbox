module RealProperties
  class Arp < ApplicationRecord
    belongs_to :real_property, polymorphic: true
  end
end
