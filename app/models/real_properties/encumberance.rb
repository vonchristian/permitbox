module RealProperties
  class Encumberance < ApplicationRecord
    belongs_to :encumberable, polymorphic: true
    has_many_attached :uploads

    def cancel!
      self.cancelled = true
      self.cancellation_date = Time.zone.now
      self.save
    end
  end
end
