module Taxpayers 
  class TaxpayerAccount < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    belongs_to :taxpayer
    devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  end
end 