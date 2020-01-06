class BusinessTaxPaymentSchedule
  attr_reader :scheduleable, :employee, :business_tax_amount, :date

  def initialize(args)
    @scheduleable = args[:scheduleable]
    @employee = args[:employee]
    @business_tax_amount = args[:business_tax_amount]
    @date = args[:date]
  end

  def create_schedule
    if !scheduleable.annually?
      create_first_schedule
      create_succeeding_schedule
    end
  end

  def create_first_schedule
    scheduleable.business_tax_receivables.create!(
      date: date,
      amount: amortized_amount,
      employee: employee
    )
  end

  def create_succeeding_schedule
    (mode_of_payment_times - 1).times do
      scheduleable.business_tax_receivables.create(
        date: succeeding_date,
        amount: amortized_amount,
        employee: employee
      )
    end
  end

  def amortized_amount
    scheduleable.payable_amount_per_schedule
  end

  def succeeding_date
    if scheduleable.quarterly?
      scheduleable.business_tax_receivables.recent.date.next_quarter.beginning_of_quarter
    elsif scheduleable.semi_annually?
      scheduleable.business_tax_receivables.recent.date.next_quarter.next_quarter.beginning_of_quarter
    end
  end

  def mode_of_payment_times
    if scheduleable.quarterly?
      4
    elsif scheduleable.semi_annually?
      2
    end
  end
end
