module Migrators
  class TricyclePermitApplicationMigrator
    def migrate!
      TricyclePermitApplication.where.not(tricycle_id: nil).each do |tricycle_permit_application|
        PermitApplications::TricyclePermitApplication.create!(
          locality: tricycle_permit_application.locality,
          account_number: tricycle_permit_application.account_number,
          application_date: tricycle_permit_application.application_date,
          application_number: tricycle_permit_application.application_number,
          applicant: tricycle_permit_application.tricycle.taxpayer_owners.first,
          permitable: tricycle_permit_application.tricycle,
          voucher: tricycle_permit_application.voucher)
        end

    end
  end
end
