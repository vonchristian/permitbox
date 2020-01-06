class BusinessPermitApplicationPolicy
  attr_reader :user, :business_permit_application
  def initialize(user, business_permit_application)
    @user = user
    @business_permit_application = business_permit_application
  end
  def new?
    user.bplo_officer?
  end
  def create?
    new?
  end
end
