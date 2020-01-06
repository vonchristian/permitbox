module GovModule
  module Treasury
    module CashBooks
      class ReceiptLineItemsController < ApplicationController
        def new
          @cash_book = current_user.cash_accounts.find(params[:cash_book_id])
          @line_item = GovModule::Treasury::CashBooks::ReceiptLineItem.new
        end
        def create
          @cash_book = current_user.cash_accounts.find(params[:cash_book_id])
          @line_item = GovModule::Treasury::CashBooks::ReceiptLineItem.new(line_item_params)
          if @line_item.valid?
            @line_item.process!
            redirect_to new_gov_module_treasury_cash_book_receipt_line_item_url(@cash_book), notice: 'added successfully.'
          else
            render :new
          end
        end

        private
        def line_item_params
          params.require(:gov_module_treasury_cash_books_receipt_line_item).
          permit(:amount, :account_id)
        end
      end
    end
  end
end
