module Vouchers
  class EntryProcessing
    include ActiveModel::Model
    attr_reader :voucher, :employee
    def initialize(args)
      @voucher     = args[:voucher]
      @employee    = args[:employee]
    end
    def process!
      ActiveRecord::Base.transaction do
        if !voucher.disbursed?
          create_entry
        end 
      end
    end

    private
    def create_entry
      entry = Accounting::Entry.new(
        locality:            voucher.locality,
        commercial_document: voucher.payee,
        description:         voucher.description,
        recorder:            voucher.preparer,
        reference_number:    voucher.reference_number,
        date:          voucher.date)

     
        entry.debit_amounts.build(
          account:             employee.default_cash_account,
          amount:              voucher.voucher_amounts.credit.total )


      voucher.voucher_amounts.credit.each do |amount|
        entry.credit_amounts.build(
          account:             amount.account,
          amount:              amount.amount
        )
      end

      entry.save!
      voucher.update!(entry: entry)
    end
  end
end
