module HealthDepartment
  class LabTest < ApplicationRecord
    belongs_to :locality, class_name: "Locations::Locality"
    validates :title, presence: true 
  end
end
