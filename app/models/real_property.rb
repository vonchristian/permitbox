class RealProperty
   def self.find(id)
     return RealPropertyTypes::Land.find_by_id(id) if RealPropertyTypes::Land.find_by_id(id).present?
    end
end
