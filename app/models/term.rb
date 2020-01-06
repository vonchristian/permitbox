class Term < ApplicationRecord
  include ExpiryMonitoring
  belongs_to :termable, polymorphic: true
end
