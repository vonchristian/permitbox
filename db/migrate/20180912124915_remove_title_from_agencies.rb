class RemoveTitleFromAgencies < ActiveRecord::Migration[5.2]
  def change
    remove_column :agencies, :title, :string
  end
end
