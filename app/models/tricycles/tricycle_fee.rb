module Tricycles 
  class TricycleFee < ApplicationRecord
    enum charge_scope: [:for_new_application, :for_renew_application, :applicable_to_all]
    #create fees applicable to tricycles
    belongs_to :locality, class_name: 'Locations::Locality'
    
    validates :name, :amount, :charge_scope, presence: true
    validates :amount, numericality: true
  end
end 