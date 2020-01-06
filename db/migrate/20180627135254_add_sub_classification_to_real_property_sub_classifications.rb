class AddSubClassificationToRealPropertySubClassifications < ActiveRecord::Migration[5.2]
  def change
    add_reference :real_property_sub_classifications, :sub_classification, foreign_key: true, type: :uuid, index: { name: "index_sub_classification_on_real_property_sub_classifications" }
  end
end
