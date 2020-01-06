# require 'paymaya'
module PaymentChannels
  class PayMayaPaymentsController < ApplicationController
    layout "taxpayers"
    skip_before_action :authenticate_user!, only: [:checkout]
    def checkout
      @business = Business.find(params[:payee_id])
      valid_checkout = {
        total_amount: {
        currency: 'PHP',
        value: "#{@business.voucher_amounts.total.to_f}"
      },
  buyer: {
    first_name: "#{current_taxpayer.first_name}",
    middle_name: 'Eichmann',
    last_name: 'Howe',
    contact: {
      phone: '(477) 575-5820',
      email: 'grayson_howe@gleichner.com'
    },
    },
  items: items,

  request_reference_number: '000141386713',
  metadata: {},
  redirect_url: {
    success: "http://localhost:3000/taxpayers/#{current_taxpayer.id}/businesses/#{@business.id}",
    failure: 'http://www.askthemaya.com/failure?id=6319921',
    cancel: 'http://www.askthemaya.com/cancel?id=6319921'
  }
}
  redirect_to Paymaya::Checkout::Checkout.create(valid_checkout)[:redirect_url]
    end
    def items
      items_array = []
      @business.voucher_amounts.each do |voucher_amount|
        items_array << {
          name: voucher_amount.name,
          quantity: 1,
          total_amount: {
            value: voucher_amount.amount * 100
          }
        }
      end
      items_array
    end
  end
end
