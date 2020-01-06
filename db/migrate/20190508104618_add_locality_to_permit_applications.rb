class AddLocalityToPermitApplications < ActiveRecord::Migration[5.2]
  def change
    add_reference :permit_applications, :locality, foreign_key: true, type: :uuid 
  end
end
