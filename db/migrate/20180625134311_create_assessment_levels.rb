class CreateAssessmentLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :assessment_levels, id: :uuid do |t|
      t.decimal :percent
      t.belongs_to :classification, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
