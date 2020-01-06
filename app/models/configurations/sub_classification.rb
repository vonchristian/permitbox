module Configurations
  class SubClassification < ApplicationRecord
    belongs_to :classification, class_name: "Configurations::Classification"
  end
end
