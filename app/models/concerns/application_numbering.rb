class ApplicationNumbering
  attr_reader :locality, :recent_business_permit_application_application, :recent_tricycle_permit_application
  def initialize(args)
    @locality = args.fetch(:locality)
    @recent_business_permit_application_application = @locality.business_permit_applications.recent
    @recent_tricycle_permit_application = @locality.tricycle_permit_applications.recent
  end

  def number
    return "" if recent_business_permit_application_application.nil?
    return "" if recent_tricycle_permit_application.nil?

    if recent_business_permit_application_application.application_number > recent_tricycle_permit_application.application_number
      Date.today.year.to_s + "-" + recent_business_permit_application_application.application_number.succ
    else
        Date.today.year.to_s + "-" + recent_tricycle_permit_application.application_number.succ
    end
  end
end
