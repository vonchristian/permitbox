class AddLocalityToEnterpriseScales < ActiveRecord::Migration[5.2]
  def change
    add_reference :enterprise_scales, :locality, foreign_key: true, type: :uuid
  end
end
