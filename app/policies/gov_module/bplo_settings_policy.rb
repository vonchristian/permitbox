module GovModule
  class BploSettingsPolicy < ApplicationPolicy
    def index?
      user.bplo_officer?
    end
  end
end
