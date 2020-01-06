class AddCartToRequiredDocuments < ActiveRecord::Migration[5.2]
  def change
    add_reference :required_documents, :cart, foreign_key: true, type: :uuid
  end
end
