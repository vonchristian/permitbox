
module Taxpayers
  class Registration
    include ActiveModel::Model
    attr_accessor :first_name, :middle_name, :last_name, :tin_number, :email, :sex, :account_number, :contact_number, :avatar, :locality_id

    validates :first_name, :middle_name, :last_name, :sex, :contact_number, presence: true
    def register!
      ActiveRecord::Base.transaction do
        create_taxpayer
      end
    end
    def find_taxpayer
      Taxpayer.find_by(account_number: account_number)
    end

    private
    def create_taxpayer
      taxpayer = Taxpayer.create!(
      avatar:         avatar_asset,
      sex:            sex,
      account_number: account_number,
      first_name:     ProperCaser.new(text: first_name).propercase,
      middle_name:    ProperCaser.new(text: middle_name).propercase,
      last_name:      ProperCaser.new(text: last_name).propercase)

      Contact.create!(
      contactable: taxpayer,
      contact_number: contact_number)
      add_to_localities(taxpayer)
    end

    def avatar_asset
      if avatar.present?
        avatar
      else
        Rails.root.join('app', 'assets', 'images', 'default.png')
      end
    end

    def find_locality
      Locations::Locality.find(locality_id)
    end
    def add_to_localities(taxpayer)
      locality_taxpayer = find_locality.locality_taxpayers.create(taxpayer: taxpayer)
      create_accounts(locality_taxpayer)
    end

    def create_accounts(locality_taxpayer)
      AccountCreators::LocalityTaxpayerAccount.new(locality_taxpayer: locality_taxpayer).create_accounts!
    end
  end
end
