class DocumentTransaction < ApplicationRecord
  belongs_to :user
  belongs_to :applicant, polymorphic: true
  has_one :term, as: :termable

  delegate :expired?, to: :term, prefix: true

  def self.current
    order(date: :desc).first
  end
end
