module ChargeCalculators
  class Surcharge
    attr_reader :surchargeable
    def initialize(args)
      @surchargeable = args.fetch(:surchargeable)
    end
    def compute!
      
    end
  end
end
