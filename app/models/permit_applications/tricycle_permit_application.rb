module PermitApplications
  class TricyclePermitApplication < PermitApplication
    has_many :tricycle_permits, class_name: "Permits::TricyclePermit", as: :permitable
    delegate :plate_number, :taxpayers_full_name, :tricycle_organization_name, to: :tricycle
    def tricycle
      permitable
    end
    def name
      tricycle.name
    end
  end
end
 
