class Taxpayer < ApplicationRecord
  include PgSearch::Model
  include Locationable
  extend LocalityScoping
  enum sex: [:male, :female]
  pg_search_scope :text_search, against: [:first_name, :middle_name, :last_name]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_one_attached :avatar
  has_one :taxpayer_account
  has_many :ownerships,  as: :owner
  has_many :locality_taxpayers, class_name: 'Localities::LocalityTaxpayer', dependent: :destroy
  has_many :lands,       through: :ownerships, source_type: "RealPropertyTypes::Land", source: :ownable
  has_many :buildings,   through: :ownerships, source_type: "RealPropertyTypes::Building", source: :ownable
  has_many :machineries, through: :ownerships, source_type: "RealPropertyTypes::Machinery", source: :ownable
  has_many :businesses,  through: :ownerships, source_type: "Business", source: :ownable
  has_many :tricycles
  has_many :contacts,    as: :contactable

  delegate :number, to: :current_contact, prefix: true, allow_nil: true

  before_save :set_default_avatar

  def self.women
    where(sex: 'female')
  end
  def name
    full_name
  end 

  def current_contact
    contacts.current
  end

  def full_name
    "#{first_name} #{middle_name.try(:first)}. #{last_name}"
  end
  def last_and_first_name
    "#{last_name}, #{first_name}"
  end

  private
  def set_default_avatar
    if !avatar.attached?
      self.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default_avatar.png')), filename: 'default-avatar.png', content_type: 'image/png')
    end
  end
end
