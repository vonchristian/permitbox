module BusinessesSection
  module Settings
    class SanitaryInspectionConfigProcessing
      include ActiveModel::Model
      attr_accessor :maximum_area, :minimum_area, :fee_amount, :revenue_account_id, :locality_id

      def process!
        ActiveRecord::Base.transaction do
          create_sanitary_inspection_config
        end
      end

      private
      def create_sanitary_inspection_config
        sanitary_config = Configurations::SanitaryInspectionConfig.create!(
          locality_id: locality_id,
          minimum_area: minimum_area,
          maximum_area: maximum_area,
          fee_amount: fee_amount
         )
      end
    end
  end
end
