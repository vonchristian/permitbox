class EnterpriseScale < ApplicationRecord
  belongs_to :locality,  class_name: "Locations::Locality"
  has_many :asset_sizes, class_name: "Businesses::AssetSize"
  has_many :businesses,  through: :asset_sizes
  
  def range
    min_asset_size..max_asset_size
  end
end
