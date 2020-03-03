class AddLocalityClassificationToLocalities < ActiveRecord::Migration[6.0]
  def change
    add_reference :localities, :locality_classification, foreign_key: true, type: :uuid 
  end
end
