module Configurations
  class PenaltyConfig < ApplicationRecord
    include CurrentFinder
    belongs_to :general_revision

    validates :rate, presence: true, numericality: true
  end
end
