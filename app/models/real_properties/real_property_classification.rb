module RealProperties
  class RealPropertyClassification < ApplicationRecord
    belongs_to :classification, class_name: "Configurations::Classification"
    belongs_to :classifiable, polymorphic: true
  end
end
