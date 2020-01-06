module Configurations
  class Classification < ApplicationRecord
    has_many :sub_classifications, class_name: "Configurations::SubClassification"
  end
end
