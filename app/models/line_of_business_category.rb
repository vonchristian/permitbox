class LineOfBusinessCategory < ApplicationRecord
  belongs_to :locality,        class_name: "Locations::Locality"
  belongs_to :revenue_account, class_name: "Accounting::Account"
  has_many :line_of_businesses

  validates :title, presence: true

  def self.revenue_accounts
    ids = pluck(:revenue_account_id)
    Accounting::Account.where(id: ids)
  end
end
