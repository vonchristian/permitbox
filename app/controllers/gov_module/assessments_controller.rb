module GovModule
  class AssessmentsController < ApplicationController
    def index
      if params[:search].present?
        @assessments = current_locality.vouchers.text_search(params[:search]).paginate(page: params[:page], per_page: 25)
      else
        @assessments = current_locality.vouchers.paginate(page: params[:page], per_page: 25)
      end
    end
  end
end
