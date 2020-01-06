module Migrators
  class TricyclePermitMigrator
    def migrate!
      TricyclePermitApplication.all.each do |tricycle_permit_application|
        permit = Permit.where(permitable_id: tricycle_permit_application.id).first
        if permit.present?
          permit.permitable = PermitApplications::TricyclePermitApplication.find_by(account_number: tricycle_permit_application.account_number)
          permit.save
        end
      end
    end
  end
end
