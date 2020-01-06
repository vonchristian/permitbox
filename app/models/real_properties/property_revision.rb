module RealProperties
  class PropertyRevision < ApplicationRecord
    belongs_to :general_revision, class_name: "Configurations::GeneralRevision"
    belongs_to :property, polymorphic: true
  end
end
