module Configurations
  class AssessmentLevel < ApplicationRecord
    belongs_to :classification
  end
end
