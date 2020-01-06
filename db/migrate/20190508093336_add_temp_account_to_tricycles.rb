class AddTempAccountToTricycles < ActiveRecord::Migration[5.2]
  def change
    add_reference :tricycles, :temporary_assessment_account, foreign_key: { to_table: :accounts }, type: :uuid 
  end
end
