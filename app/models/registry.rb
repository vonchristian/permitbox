class Registry < ApplicationRecord
  has_one_attached :spreadsheet
  belongs_to :locality, class_name: "Locations::Locality"
  belongs_to :employee, class_name: "User", foreign_key: 'employee_id'

end
