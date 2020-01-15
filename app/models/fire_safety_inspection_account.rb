class FireSafetyInspectionAccount < ApplicationRecord
  belongs_to :fire_safety_inspection_config, class_name: 'Configurations::FireSafetyInspectionConfig'
  belongs_to :account, class_name: 'Accounting::Account'
end
