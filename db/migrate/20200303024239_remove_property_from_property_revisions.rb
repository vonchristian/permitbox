class RemovePropertyFromPropertyRevisions < ActiveRecord::Migration[6.0]
  def change
    remove_reference :property_revisions, :property, polymorphic: true, null: false, type: :uuid 
  end
end
