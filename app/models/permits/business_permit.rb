module Permits
  class BusinessPermit < Permit
    delegate :business, to: :permitable
    delegate :name, to: :business, prefix: true
    
  end
end
