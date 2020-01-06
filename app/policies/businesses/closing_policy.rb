module Businesses
  class ClosingPolicy
    attr_reader :user, :business
    def initialize(args)
      @user     = args.fetch(:user)
      @business = args.fetch(:business)
    end
    
    def new?
      user.bplo_officer? && !business.closed?
    end

    def  create?
      new?
    end
  end
end
