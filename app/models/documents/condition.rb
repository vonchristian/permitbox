module Documents
  class Condition < ApplicationRecord
    belongs_to :document
  end
end
