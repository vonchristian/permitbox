class PermitSignatory < ApplicationRecord
  belongs_to :permit
  belongs_to :signatory
  delegate :full_name, :designation, to: :signatory
end
