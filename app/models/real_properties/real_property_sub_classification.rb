module RealProperties
  class RealPropertySubClassification < ApplicationRecord
    belongs_to :sub_classification, class_name: "Configurations::SubClassification"
    belongs_to :sub_classifiable, polymorphic: true
  end
end
