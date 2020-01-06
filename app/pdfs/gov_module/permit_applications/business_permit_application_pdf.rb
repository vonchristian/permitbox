module GovModule
  module PermitApplications
    class BusinessPermitApplicationPdf < Prawn::Document
      attr_reader :business_permit_application, :locality
      def initialize(args)
        super(margin: 30, page_size: "LETTER", page_layout: :portrait, margin: 30)
        @business_permit_application = args.fetch(:business_permit_application)
        @locality                    = @business_permit_application.locality
        logo
        heading
      end

      private
      def logo
        image "#{Rails.root}/app/assets/images/#{locality.name.downcase}_logo.jpg", width: 70, height: 70, :at => [40, 715]
        image "#{Rails.root}/app/assets/images/side_logo.jpg", width: 75, height: 70, :at => [440, 715]
        draw_text "UMUNA TI LAMUT", size: 9, :at => [40, 635]
      end

      def heading
        move_down 20
        text 'Republic of the Philippines', size: 10, align: :center
        text 'Province of Ifugao', size: 10, align: :center
        text 'MUNICIPALITY OF LAMUT', size: 10, align: :center
        move_down 5
        text 'OFFICE OF THE MUNICIPAL MAYOR', size: 10, align: :center, style: :bold
        move_down 15
        text "MAYOR'S PERMIT", align: :center, size: 28, style: :bold
        stroke do
          line_width 1.5
          horizontal_line(35, 520)
        end
      end
    end
  end
end
