module GovModule
  module Permits
    class CancellationsController < ApplicationController
      def create
        @permit = Permit.find(params[:permit_id])
        @permit.cancel!
        redirect_to "/", notice: 'Permit cancelled successfully'
      end
    end
  end
end
