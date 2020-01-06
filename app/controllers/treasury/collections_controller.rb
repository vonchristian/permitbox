module Treasury
  class CollectionsController < ApplicationController
    def index
      @cash_on_hand_account = current_user.default_cash_account
      @entries = @cash_on_hand_account.debit_entries
    end
  end
end
