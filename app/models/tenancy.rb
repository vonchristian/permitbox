class Tenancy < ApplicationRecord
  enum tenancy_type: [:regular, :transient]
  belongs_to :tenant, polymorphic: true
  belongs_to :land_lord, polymorphic: true, optional: true
  belongs_to :public_market
  delegate :name, to: :public_market, prefix: true
  def self.recent
    order(created_at: :desc).first
  end
end
