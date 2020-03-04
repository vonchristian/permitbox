class PublicMarket < ApplicationRecord
  belongs_to :locality, class_name: "Locations::Locality"
  belongs_to :barangay, class_name: "Locations::Barangay"
  has_many :tenancies
  has_many :businesses,                   through: :tenancies, source: :tenant, source_type: "Business"
  has_many :business_permit_applications, through: :businesses 
  has_many :business_permits,             through: :businesses, class_name: "Permits::BusinessPermit"
  
  delegate :name, to: :barangay, prefix: true

  def regular_business_permits
    ids = regular_tenants.map { |a| a.business_permit_applications.ids } 
    Permits::BusinessPermit.where(permitable_id: ids.compact.flatten.uniq)
  end

  def transient_business_permits
    ids = transient_tenants.map { |a| a.business_permit_applications.ids } 
    Permits::BusinessPermit.where(permitable_id: ids.compact.flatten.uniq)
  end

  def regular_tenants
    ids = tenancies.regular.where(tenant_id: businesses.ids.compact.flatten.uniq).pluck(:tenant_id)
    businesses.where(id: ids.compact.flatten.uniq)
  end

  def transient_tenants
    ids = tenancies.transient.where(tenant_id: businesses.ids.compact.flatten.uniq).pluck(:tenant_id)
    businesses.where(id: ids.compact.flatten.uniq)
  end
end
