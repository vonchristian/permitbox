module BusinessesSection
  module Settings
    class LineOfBusinessProcessing
      include ActiveModel::Model
      attr_accessor :line_of_business_category_id, :name, :fee_amount, :revenue_account_id, :locality_id, :competetive_index_category_id
      def process!
        ActiveRecord::Base.transaction do
          create_line_of_business
        end
      end

      private
      def create_line_of_business
        charge = Charge.create!(locality_id: locality_id, name: "Mayors Permit Fee - #{name}", amount: fee_amount, revenue_account: find_line_of_business_category.revenue_account)
        find_line_of_business_category.line_of_businesses.create!(name: name, fee_amount: fee_amount, locality_id: locality_id, competetive_index_category_id: competetive_index_category_id)
      end
      def find_line_of_business_category
        LineOfBusinessCategory.find_by_id(line_of_business_category_id)
      end
    end
  end
end
