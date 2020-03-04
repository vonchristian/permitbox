class AddBarangayToPublicMarkets < ActiveRecord::Migration[6.0]
  def change
    add_reference :public_markets, :barangay, foreign_key: true, type: :uuid 
  end
end
