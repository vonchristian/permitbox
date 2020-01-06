class AreaMeasurement < ApplicationRecord
  belongs_to :measurable, polymorphic: true
  def self.current
    order(created_at: :desc).first
  end
  
  def self.recent
    current
  end
end
