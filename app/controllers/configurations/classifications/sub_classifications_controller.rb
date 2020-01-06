module Configurations
  module Classifications
    class SubClassificationsController < ApplicationController
      def new
        @classification = Configurations::Classification.find(params[:classification_id])
        @sub_classification = @classification.sub_classifications.build
      end
      def create
        @classification = Configurations::Classification.find(params[:classification_id])
        @sub_classification = @classification.sub_classifications.create(sub_classification_params)
        if @sub_classification.valid?
          @sub_classification.save!
          redirect_to configurations_classification_url(@classification), notice: "Sub Classification created successfully"
        else
          render :new
        end
      end

      private
      def sub_classification_params
        params.require(:configurations_sub_classification).
        permit(:title)
      end
    end
  end
end
