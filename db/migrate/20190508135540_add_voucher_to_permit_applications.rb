class AddVoucherToPermitApplications < ActiveRecord::Migration[5.2]
  def change
    add_reference :permit_applications, :voucher, foreign_key: true, type: :uuid 
  end
end
