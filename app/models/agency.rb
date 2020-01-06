class Agency < ApplicationRecord
  has_one_attached :logo
  has_many :users
  has_many :documents, as: :issuing_office
  has_many :approved_documents, through: :documents, source: :approvals
end
