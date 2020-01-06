class AccountBudget < ApplicationRecord
  belongs_to :account
  belongs_to :locality
  #has_many :budget_realignments
    #amount
    #destination_account
    #date
    #description
end
