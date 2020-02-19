module RealProperties
  class Arp < ApplicationRecord
    #ARP=Assessment of Real Property Number 
    belongs_to :real_property, polymorphic: true
  end
end
