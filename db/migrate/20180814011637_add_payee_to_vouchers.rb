class AddPayeeToVouchers < ActiveRecord::Migration[5.2]
  def change
    add_reference :vouchers, :payee, polymorphic: true, type: :uuid
  end
end
