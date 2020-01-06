class TaxpayerAccount < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :taxpayer, optional: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
