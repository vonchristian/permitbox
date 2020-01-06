module Permits
  class TricyclePermit < Permit
    has_many :permitted_tricycles, class_name: "Tricycle", as: :permitable
  end
end
