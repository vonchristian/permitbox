class CapitalTaxConfig < ApplicationRecord
  belongs_to :locality
  belongs_to :revenue_account, class_name: "Accounting::Account"
  def self.recent
    order(created_at: :desc).first
  end
end
