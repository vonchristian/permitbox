class PaymentProcessing
  include ActiveModel::Model
  attr_accessor :reference_number, :employee_id, :date, :voucher_id, :cash_account_id
  validates :reference_number, :date, presence: true
  def process!
    ActiveRecord::Base.transaction do
      create_entry
    end
  end

  private
  def create_entry
    entry = Accounting::Entry.new(
      date: date,
      locality: find_employee.locality,
      recorder: find_employee,
      commercial_document: find_voucher,
      reference_number: reference_number,
      description: "Payment of taxes and fees")
    
      find_voucher.voucher_amounts.credit.each do |voucher_amount|
        entry.credit_amounts.build(
        amount:  voucher_amount.amount.amount,
        account: voucher_amount.account)
      end
      entry.debit_amounts.build(
      amount:  find_voucher.voucher_amounts.credit.total,
      account: cash_on_hand_account)
  
    entry.save!
    
    set_voucher_entry(entry)
  end

  def set_voucher_entry(entry)
    find_voucher.update!(entry_id: entry.id)
  end

  def find_voucher
    Voucher.find(voucher_id)
  end
  
  def cash_on_hand_account
    Accounting::Asset.find(cash_account_id)
  end

  def find_employee
    User.find(employee_id)
  end
end
