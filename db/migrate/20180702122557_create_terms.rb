class CreateTerms < ActiveRecord::Migration[5.2]
  def change
    create_table :terms, id: :uuid do |t|
      t.belongs_to :termable, polymorphic: true, type: :uuid
      t.datetime :effectivity_date
      t.datetime :expiry_date

      t.timestamps
    end
  end
end
