module Businesses
  class RequiredDocument < ApplicationRecord
    belongs_to :business, optional: true
    belongs_to :document
    belongs_to :cart, optional: true
    has_many :applications, class_name: "DocumentTransactions::Application"
    has_many :approvals, class_name: "DocumentTransactions::Approval"
    has_many :verifications, class_name: "DocumentTransactions::Verification"
    has_many_attached :attachments


    delegate :title, :issuing_office_name, :issuing_office, to: :document
    delegate :date, to: :current_application, prefix: true, allow_nil: true
    delegate :date, to: :current_approval, prefix: true, allow_nil: true

    def self.approved
      all.select{|a| a.approved? }
    end
    def current_application
      applications.current
    end
    def current_approval
      approvals.current
    end
    def approved?
      approvals.present?
    end
    def verified?(options={})
      verifications.entered_on(options).present?
    end
    def elapsed_time
      if current_application && current_approval
        (current_approval.date - current_application.date) /86400
      else
        0
      end
    end
  end
end
