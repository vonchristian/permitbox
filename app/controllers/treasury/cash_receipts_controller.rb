
module Treasury 
  class CashReceiptsController < ApplicationController
    def index 
      @cash_account   = current_user.default_cash_account
      @pagy, @entries = pagy(@cash_account.debit_entries)
    end 

    def show 
      @cash_account = current_user.default_cash_account
      @entry        = @cash_account.debit_entries.find(params[:id])
    end 
  end 
end 
