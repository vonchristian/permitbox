module GovModule
  module Treasury
    class CashBooksController < ApplicationController
      def index
        @cash_books = current_user.cash_accounts
      end
    end
  end
end 
