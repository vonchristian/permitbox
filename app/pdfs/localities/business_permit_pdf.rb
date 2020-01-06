require 'barby'
require 'barby/barcode/code_128'
require 'barby/outputter/prawn_outputter'
require 'prawn/icon'
module Localities
  class BusinessPermitPdf < Prawn::Document
    attr_reader :permit, :locality, :entry
    def initialize(args)
      super(margin: 50, page_size: "A4", page_layout: :portrait, margin: 30)
      @permit       = args[:permit]
      @locality     = @permit.locality
      @entry        = @permit.entry
      @voucher      = @permit.voucher
      logo
      heading
      business_info
      taxpayer
      signatory
      assessment_details
      footer
      font Rails.root.join("app/assets/fonts/open_sans_light.ttf")

    end
    private
    def price(number)
      view_context.number_to_currency(number, :unit => "P ")
    end
    def logo
      image "#{Rails.root}/app/assets/images/#{locality.name.downcase}_logo.jpg", width: 75, height: 75, :at => [40, 790]
      draw_text "UMUNA TI LAMUT", size: 9, :at => [40, 705]
    end
    def heading
      text 'Republic of the Philippines', size: 10, align: :center
      text 'Province of Ifugao', size: 10, align: :center
      text 'MUNICIPALITY OF LAMUT', size: 10, align: :center
      move_down 5
      text 'OFFICE OF THE MUNICIPAL MAYOR', size: 10, align: :center, style: :bold
      move_down 25
      text "MAYOR'S PERMIT", align: :center, size: 28, style: :bold
      stroke do
        stroke_color '24292E'
        line_width 2
        stroke_horizontal_rule
        move_down 5
      end
    end
    def business_info
      bounding_box([10, 670], :width => 600, :height => 100) do
        table business_info_table_data,
          column_widths: [100, 150, 150, 150] do
          cells.borders = []
          row(0).font_style = :italic
          row(0).size = 8

          row(0).align = :center
          row(1).align = :center
          row(1).size = 20
          row(1).font_style = :bold
        end
      end
    end
    def business_info_table_data
      bounding_box([0,500], :width => 350, :height => 80) do
        stroke_color 'FFFFFF'
        stroke_bounds
        stroke do
            stroke_color 'FFFF00'
            fill_color '36DA5C'
            fill_and_stroke_rounded_rectangle [cursor-80,cursor], 350, 80, 10
            fill_color '000000'
        end
    end
      table([["BUSINESS PLATE NO.", "TRANSACTION TYPE", "BUSINESS PERMIT NO.", "YEAR"]] +
      [["#{permit.plate_number}", "#{business.business_type_text}", "#{permit.permit_number}", "#{permit.approval_date.year}"]]) do
        column(3).background_color = '#f7c531'
      end
    end
    def taxpayer
    bounding_box([20, 600], :width => 330) do
      text "IS HEREBY GRANTED TO", size: 10, style: :italic
      move_down 10
      text "NAME OF TAXPAYER", size: 10, style: :italic
      move_down 2
      text "#{business.taxpayers_full_name.upcase}", style: :bold, size: 16
      move_down 10
      text "BUSINESS TRADENAME", size: 10, style: :italic
      move_down 2
      text "#{business.name.upcase}",  style: :bold, size: 16
      move_down 10
      text "BUSINESS ADDRESS", size: 10, style: :italic
      move_down 2
      text "#{business.current_location_complete_address.try(:upcase)}", style: :bold, size: 10
      move_down 10
      text "to engage, operate and/or continue their business", size: 10, style: :italic
      move_down 5
      text "LINE(S) OF BUSINESS", size: 10, style: :italic
        table line_of_business_table_data,
          cell_style: { size: 9, padding: [0,0,2,0], inline_format: true }, column_widths: [20, 280] do
            cells.borders = []
        end
      end
    end
    def line_of_business_table_data
      @line_of_business_table_data ||= business.business_activities.map{|e| ["(#{e.quantity.to_i})", "<b>#{e.line_of_business.name.upcase}</b>"] }
    end
    def signatory
      bounding_box [10, 290], width: 300 do
        text "Approved By:"

        text "#{Signatory.recent.full_name.try(:upcase)}", align: :center, size: 14, style: :bold
        # text "#{BploSection::Settings::Signatory.order(created_at: :asc).last.try(:designation).try(:upcase)}", align: :center, size: 10
        move_down 10

        icon "<icon size='9'>fa-lock</icon> Having complied with the provisions of the Municipal Tax Ordinance and the rules and regulations issued pursuant thereto.", inline_format: true, size: 9
        move_down 10
        icon "<icon size='9'>fa-lock</icon> This permit is revoked/cancelled once the conditions stipulated in his/her application is violated.", size: 9, inline_format: true
      end
    end
    def assessment_details
    bounding_box([340, 600], :width => 190) do
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
        text "#{permit.expiry_date.strftime("%B %e, %Y")}",  style: :bold, size: 10, align: :center
        text "EXPIRY DATE", size: 9, align: :center

      end
    end
  end
  def assessment_table_data
    @assessment_table_data ||= voucher.voucher_amounts.map { |e| [e.name, price(e.amount)] } +
    [["<b>TOTAL</b>",  "<b>#{price(voucher.total)}</b>"]]
  end
  def payment_table_data
    [[ "MODE OF PAYMENT",  "#{business.mode_of_payment}"]]
    [[ "AMOUNT PAID", "#{price(entry.debit_amounts.sum(&:amount))}"]] +
    [[ "OFFICIAL RECEIPT", "#{entry.reference_number}"]] +
    [[ "DATE PAID", "#{entry.date.strftime("%D")}"]]
  end
  def footer
    bounding_box([0, 10], width: 170) do
      barcode = Barby::Code128.new(permit.permit_number)
      barcode.annotate_pdf(self, height: 20)
      move_down 3
      text "PERMIT NO. #{permit.permit_number}", size: 6
    end

    bounding_box([365, 10], width: 600) do
      barcode = Barby::Code128.new(entry.reference_number)
      barcode.annotate_pdf(self, height: 20)
      move_down 3
      text "OFFICIAL RECEIPT: #{entry.reference_number}", size: 6
    end
  end
  end
end
