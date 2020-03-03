module Tricycles 
  class TricycleCharge < ApplicationRecord
    belongs_to :tricycle, optional: true 
    belongs_to :tricycle_permit_application, optional: true 
    belongs_to :revenue_account, class_name: 'Accounting::Revenue'
    belongs_to :tricycle_fee,    class_name: 'Tricycles::TricycleFee'

    validates :tricycle_fee_id, uniqueness: { scope: :tricycle_id }

    
    delegate :name, :amount, to: :tricycle_fee, prefix: true
  end
end  