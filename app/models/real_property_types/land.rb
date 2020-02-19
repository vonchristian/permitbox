module RealPropertyTypes
  class Land < ApplicationRecord
    has_many :ownerships, as: :ownable
    has_many :taxpayer_owners, through: :ownerships, source: :owner, source_type: "Taxpayer"

    has_many :valuations, as: :valuable, class_name: "RealProperties::Valuation"
    has_many :property_revisions, class_name: "RealProperties::PropertyRevision", as: :property
    has_many :arps,          as: :real_property, class_name: "RealProperties::Arp"
    has_many :adjustments,   class_name: "RealProperties::Adjustment", as: :adjustable
    has_many :encumberances, class_name: "RealProperties::Encumberance", as: :encumberable
    has_many :area_measurements, as: :measurable
    has_many :real_property_classifications, as: :classifiable, class_name: "RealProperties::RealPropertyClassification"
    has_many :real_property_sub_classifications, as: :sub_classifiable, class_name: "RealProperties::RealPropertySubClassification"

    has_many_attached :uploads
     delegate :number, to: :current_arp, prefix: true, allow_nil: true
    def current_arp
      arps.current
    end
  end
end
