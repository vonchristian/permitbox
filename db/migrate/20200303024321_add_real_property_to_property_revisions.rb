class AddRealPropertyToPropertyRevisions < ActiveRecord::Migration[6.0]
  def change
    add_reference :property_revisions, :real_property, polymorphic: true, null: false, type: :uuid , index: { name: 'index_real_property_on_property_revisions' }
  end
end
 