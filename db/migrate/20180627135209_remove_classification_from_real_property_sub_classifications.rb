class RemoveClassificationFromRealPropertySubClassifications < ActiveRecord::Migration[5.2]
  def change
    remove_reference :real_property_sub_classifications, :classification, foreign_key: true, type: :uuid
  end
end
