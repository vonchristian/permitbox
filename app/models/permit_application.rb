class PermitApplication < ApplicationRecord

  enum application_type: [:new_application, :renew]
  belongs_to :applicant,  polymorphic: true
  belongs_to :permitable, polymorphic: true
  belongs_to :voucher,    optional: true
  belongs_to :locality,   class_name: 'Locations::Locality'
  # validates :application_number, presence: true, uniqueness: true

  def self.recent
    order(application_date: :desc).first
  end
end
