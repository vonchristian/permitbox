module Budgeting 
  class AccountBudget < ApplicationRecord
    belongs_to :account, class_name: 'Accounting::Account'
    belongs_to :locality, class_name: 'Locations::Locality'
    #has_many :budget_realignments
      #amount
      #destination_account
      #date
      #description
  end
end 