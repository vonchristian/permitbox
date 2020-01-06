module Taxpayers
  class AccountRegistration
    include ActiveModel::Model
    attr_accessor :first_name, :middle_name, :last_name, :tin_number, :email, :password, :password_confirmation, :account_number, :contact_number, :avatar
    validates :first_name, :middle_name, :last_name, :email, :password, :password_confirmation, presence: true
    def register!
      ActiveRecord::Base.transaction do
        create_taxpayer_account
      end
    end
    def find_taxpayer_account
      TaxpayerAccount.find_by(
        email: email)
    end

    private
    def create_taxpayer_account
      taxpayer = Taxpayer.find_or_create_by(
      first_name: first_name,
      middle_name: middle_name,
      last_name: last_name)
      TaxpayerAccount.create(
        taxpayer: taxpayer,
        email: email,
        password: password,
        password_confirmation: password_confirmation)
    end
  end
end
