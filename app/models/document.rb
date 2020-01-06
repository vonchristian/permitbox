class Document < ApplicationRecord

  belongs_to :locality, class_name: "Locations::Locality", optional: true
  belongs_to :issuing_office, polymorphic: true

  has_many :conditions, class_name: "Documents::Condition"
  has_many :prerequisites, class_name: "Documents::Prerequisite", foreign_key: 'main_document_id'
  has_many :required_documents, class_name: "Businesses::RequiredDocument"
  has_many :approvals, through: :required_documents

  delegate :name, to: :issuing_office, prefix: true, allow_nil: true

  validates :title, presence: true, uniqueness: { scope: :locality_id }
end
