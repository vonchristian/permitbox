class AddLocalityToLabTests < ActiveRecord::Migration[6.0]
  def change
    add_reference :lab_tests, :locality, null: false, foreign_key: true, type: :uuid 
  end
end
