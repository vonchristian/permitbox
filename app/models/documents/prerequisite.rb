module Documents
  class Prerequisite < ApplicationRecord
    belongs_to :main_document, class_name: "Document", foreign_key: 'main_document_id'
    belongs_to :sub_document, class_name: "Document", foreign_key: 'sub_document_id'
  end
end
