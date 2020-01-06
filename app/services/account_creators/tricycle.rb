module AccountCreators
  class Tricycle
    attr_reader :tricycle
    def initialize(args)
      @tricycle = args.fetch(:tricycle)

    end
    def create_accounts!
      if tricycle.temporary_assessment_account.blank?
        account = Accounting::Asset.create!(
        name:     "Temporary Assessment Account - #{tricycle.account_number}",
        code:     SecureRandom.uuid)

        tricycle.locality.accounts << account

        tricycle.update(temporary_assessment_account: account)
      end
    end
  end
end
