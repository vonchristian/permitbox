module AccountCreators
  class LocalityTaxpayerAccount
    attr_reader :locality_taxpayer
    def initialize(args={})
      @locality_taxpayer = args.fetch(:locality_taxpayer)
    end
    def create_accounts!
      create_receivable_account
    end
    def create_receivable_account
      if locality_taxpayer.blank?
        account = Accounting::Asset.create!(
        name:     receivable_account_name,
        code:     SecureRandom.uuid,
        locality: locality)

        locality_taxpayer.update(receivable_account: account)
      end
    end
  end
end
