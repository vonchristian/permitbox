class Permit < ApplicationRecord
  has_secure_token
  enum permit_type: [:new_permit, :renew]
  include ExpiryMonitoring
  belongs_to :permitable, polymorphic: true
  belongs_to :locality, class_name: "Locations::Locality"
  has_many :permit_signatories
  has_many :signatories, through: :permit_signatories
  delegate :taxpayers_last_and_first_name, to: :permitable
  delegate :locality_name, to: :permitable
  delegate :voucher, to: :permitable, allow_nil: true
  delegate :entry, to: :voucher, allow_nil: true
  delegate :name, to: :locality, prefix: true
  validates :expiry_date, :approval_date, :permit_number, presence: true
  
  def template_processor
    "MayorsPermitTemplates::#{locality_name.titleize}".constantize
  end 

  def self.recent
    order(approval_date: :desc).first
  end

  def self.approved(args={})
    if args[:from_date] && args[:to_date]
      range = DateRange.new(from_date: args[:from_date], to_date: args[:to_date])
      where('approval_date' => range.start_date..range.end_date )
    else
      all
    end
  end
  def self.approved_at(args={})
    if args[:from_date] && args[:to_date]
      date_range = DateRange.new(from_date: args[:from_date], to_date: args[:to_date])
      where('approval_date' => date_range.start_date..date_range.end_date)
    end
  end

  def self.cancelled
    where.not(cancelled_at: nil)
  end

  def self.not_cancelled
    where(cancelled_at: nil)
  end


  def self.expired
   where('expiry_date < ?', Date.today)
  end

  def cancelled?
    cancelled_at.present?
  end

  def cancel!
    self.update!(cancelled_at: Date.current)
  end
end
