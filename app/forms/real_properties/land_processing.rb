module RealProperties
  class LandProcessing
    include ActiveModel::Model
    attr_accessor :street, :barangay, :locality, :province,
    :east_boundary, :west_boundary, :north_boundary, :south_boundary,
    :taxable,
    :block_number, :survey_number, :oct_number, :lot_number,
    :area, :classification, :market_value, :assessment_level,
    :administrator, :administrator_address, :uploads, :taxpayer_id
    def save
      ActiveRecord::Base.transaction do
        create_land
      end
    end

    private
    def create_land
      land = RealPropertyTypes::Land.create!(
        east_boundary: east_boundary,
        west_boundary: west_boundary,
        north_boundary: north_boundary,
        south_boundary: south_boundary,
        uploads: [])
      land.ownerships.create(owner: find_taxpayer)
    end
    def find_taxpayer
      Taxpayer.find_by_id(taxpayer_id)
    end
  end
end
