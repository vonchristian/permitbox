module GovModule 
  module Businesses 
    class AssessmentLineItem 
      include ActiveModel::Model

      attr_accessor :business_id, :cart_id, :amount 
    end 
  end 
end 