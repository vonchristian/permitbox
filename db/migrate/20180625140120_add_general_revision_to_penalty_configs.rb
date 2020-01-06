class AddGeneralRevisionToPenaltyConfigs < ActiveRecord::Migration[5.2]
  def change
    add_reference :penalty_configs, :general_revision, foreign_key: true, type: :uuid
  end
end
