class AddLocalityToMachineries < ActiveRecord::Migration[5.2]
  def change
    add_reference :machineries, :locality, foreign_key: true, type: :uuid
  end
end
