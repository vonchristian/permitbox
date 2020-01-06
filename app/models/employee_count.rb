class EmployeeCount < ApplicationRecord
  belongs_to :business
  belongs_to :locality, class_name: "Locations::Locality"
  def self.recent
    order(date: :asc).first
  end
end
