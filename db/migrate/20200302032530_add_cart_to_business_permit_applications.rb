class AddCartToBusinessPermitApplications < ActiveRecord::Migration[6.0]
  def change
    add_reference :business_permit_applications, :cart,  foreign_key: true, type: :uuid 
  end
end
