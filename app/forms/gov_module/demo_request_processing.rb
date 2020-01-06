module GovModule
  class DemoRequestProcessing
    include ActiveModel::Model
    attr_accessor :locality, :email, :message
    validates :locality, :email, :message, presence: true
    def save
      ActiveRecord::Base.transaction do
        create_demo_request
      end
    end

    private
    def create_demo_request
      DemoRequest.create(
        email: email,
        locality: locality,
        message: message)
    end
  end
end
