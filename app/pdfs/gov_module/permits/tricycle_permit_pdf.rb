require 'barby'
require 'barby/barcode/code_128'
require 'barby/outputter/prawn_outputter'
require 'prawn/icon'
module GovModule
  module Permits
    class TricyclePermitPdf < Prawn::Document
      attr_reader :locality, :tricycle, :permit, :view_context, :voucher, :entry
      def initialize(args)
        super(margin: 30, page_size: "LETTER", page_layout: :portrait, margin: 30)
        @permit       = args[:permit]
        @permitable   = @permit.permitable
        @locality     = @permit.locality
        @tricycle     = @permitable.tricycle
        @view_context = args[:view_context]
        @voucher      = @permitable.voucher
        @entry        = @voucher.entry
        border_image
        logo
        heading
        tricycle_info
        taxpayer
        signatory
        assessment_details
        font Rails.root.join("app/assets/fonts/open_sans_light.ttf")
      end
      private
      def price(number)
        view_context.number_to_currency(number, :unit => "P ")
      end

      def logo
        image "#{Rails.root}/app/assets/images/#{locality.name.downcase}_logo.jpg", width: 70, height: 70, :at => [40, 715]
        image "#{Rails.root}/app/assets/images/side_logo.jpg", width: 70, height: 70, :at => [420, 715]
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
          horizontal_line(35, 510)
        end
      end

      def tricycle_info
        bounding_box([20, 605], :width => 600, :height => 100) do
          table tricycle_info_table_data,
            column_widths: [100,100, 100, 100, 80] do
            cells.borders = []
            row(0).font_style = :italic
            row(0).size = 8

            row(0).align = :center
            row(1).align = :center

            row(1).size = 16
            row(1).font_style = :bold
            column(4).background_color = "FFD20F"
            column(3).font_size = 20


          end
        end
      end

      def tricycle_info_table_data
        [["MTOP NO", "LTO PLATE NO.", "TRANSACTION TYPE", "PERMIT NO.", "YEAR"]] +
        [["#{tricycle.mtop_number}", "#{tricycle.plate_number}", "#{permit.permit_type.try(:titleize).try(:upcase).gsub("PERMIT", "")}", "#{permit.permit_number}", "#{permit.approval_date.year}"]]
      end

      def taxpayer
      bounding_box([30, 540], :width => 300) do
        text "IS HEREBY GRANTED TO", size: 10, style: :italic, align: :center
        move_down 15
        text "#{tricycle.taxpayers_full_name.upcase}", style: :bold, size: 14, align: :center
        text "Operator/Proprietor/Manager/Representative", size: 8, style: :italic, align: :center
        move_down 15
        text "to engage, operate and/or continue their business:", size: 10, style: :italic, align: :center
        move_down 15
        text "TRICYCLE OPERATOR (#{tricycle.tricycle_organization_abbreviated_name.try(:upcase)})",  style: :bold, size: 14, align: :center
        text "Line of Business", size: 8, style: :italic, align: :center

        move_down 15
        move_down 10


        end
      end


      def signatory
        bounding_box [30, 220], width: 300 do
          text "Approved by:"
          move_down 30
          text "#{permit.signatories.last.try(:full_name).try(:upcase)}", align: :center, size: 14, style: :bold
          text "#{permit.signatories.last.try(:designation).try(:upcase)}", align: :center, size: 10
          move_down 20

          text "Having complied with the provisions of the Municipal Tax Ordinance and the rules and regulations issued pursuant thereto.", style: :italic, size: 9
          move_down 5
          text "This permit is revoked/cancelled once the conditions stipulated in his/her application is violated.", size: 9, style: :italic
          move_down 5
          text " This permit must be displayed at a conspicuous space at the business place.", size: 9,style: :italic

        end
      end

      def assessment_details
        bounding_box([330, 540], :width => 190) do
          text ''
          move_down 5
          text "ASSESSMENT DETAILS", style: :bold, size: 9
          move_down 3
          if assessment_table_data.empty?
            text "No assessments"
          else
            table assessment_table_data,
            cell_style: { size: 7, padding: [0,0,4,0], inline_format: true  }, column_widths: [120, 60] do
              cells.borders = []
              column(1).align = :right
            end
            move_down 20
            text "PAYMENT DETAILS", style: :bold, size: 9
            table payment_table_data,
            cell_style: { size: 7, padding: [0,0,4,0], }, column_widths: [120, 60] do
              cells.borders = []
              column(1).align = :right
            end
            move_down 10
            stroke do
              stroke_color '24292E'
              line_width 0.5
              stroke_horizontal_rule
              move_down 5
            end
            move_down 20
            text "#{permit.approval_date.strftime("%B %e, %Y")}", style: :bold, size: 10, align: :center
            text "DATE ISSUED",  size: 9, align: :center
            move_down 20
            text "#{permit.expiry_date.strftime("%B %e, %Y")}",  style: :bold, size: 10, align: :center, color: "FF4B4B"
            text "EXPIRY DATE", size: 9, align: :center, color: "FF4B4B"


          end
        end
      end
      def assessment_table_data
        voucher.voucher_amounts.non_discount_amounts.with_non_zero_amounts.map { |e| [e.name, price(e.amount)] } +
        [["<b>SUBTOTAL</b>",  "<b>#{price(voucher.voucher_amounts.non_discount_amounts.total)}</b>"]] +
        voucher.voucher_amounts.discount_amounts.with_non_zero_amounts.map { |e| [e.name, price(e.amount)] } +
        [["<b>DISCOUNTS</b>",  "<b>#{price(voucher.voucher_amounts.discount_amounts.total)}</b>"]] +
        [["<b>TOTAL</b>",  "<b>#{price(voucher.voucher_amounts.total_less_discount)}</b>"]]



      end

      def payment_table_data
        [["OR NUMBER", "#{@entry.reference_number}"]] + 
        [[ "AMOUNT PAID", "#{price(entry.amounts.cash_amount_total)}"]] +
        [[ "OFFICIAL RECEIPT", "#{entry.reference_number}"]] +
        [[ "DATE PAID", "#{entry.date.strftime("%D")}"]]
      end
      def border_image
        image "#{Rails.root}/app/assets/images/border.jpg", width: bounds.width + 10, height: bounds.height + 20, :at => [0, 740]
      end
    end
  end
end
