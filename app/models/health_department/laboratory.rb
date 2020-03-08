module HealthDepartment
  class Laboratory < ApplicationRecord
    belongs_to :locality
  end
end 