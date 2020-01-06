class AddPermitableToPermitApplications < ActiveRecord::Migration[5.2]
  def change
    add_reference :permit_applications, :permitable, polymorphic: true, type: :uuid 
  end
end
