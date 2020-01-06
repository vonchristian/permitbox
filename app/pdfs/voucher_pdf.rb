class VoucherPdf < Prawn::Document
  attr_reader :voucher, :view_context, :locality, :date
  def initialize(args)
    super(margin: 40, page_size: "A4", page_layout: :portrait)
    @voucher = args[:voucher]
    @locality = @voucher.locality
    @view_context = args[:view_context]
    @date = @voucher.date
    logo
    heading
    business_details
    non_discount_amount_details
    discount_amount_details
    signatory
  end
  private
  def price(number)
    view_context.number_to_currency(number, :unit => "P ")
  end
  def logo
    image "#{Rails.root}/app/assets/images/#{locality.name.downcase}_logo.jpg", width: 75, height: 75, :at => [40, 780]
    draw_text "UMUNA TI LAMUT", size: 9, :at => [40, 690]
  end
  def heading
    text 'Republic of the Philippines', size: 10, align: :center
    text 'Province of Ifugao', size: 10, align: :center
    text 'MUNICIPALITY OF LAMUT', size: 10, align: :center
    move_down 5
    text 'OFFICE OF THE MUNICIPAL MAYOR', size: 10, align: :center, style: :bold
    move_down 25
    text "Assessment of Fees and Taxes", align: :center, size: 12, style: :bold
    stroke_horizontal_rule
  end

  def business_details
    table([["", "Business Name:", "#{voucher.name}"]], cell_style: { size: 10 }, column_widths: [50, 120, 330]) do
      cells.borders = []
    end
    table([["", "Taxpayer:", "#{voucher.payee.try(:taxpayers_full_name)}"]], cell_style: { size: 10 }, column_widths: [50, 120, 330]) do
      cells.borders = []
    end
    table([["", "Mode of Payment:", "#{voucher.payee.try(:mode_of_payment)}"]], cell_style: { size: 10 }, column_widths: [50, 120, 330]) do
      cells.borders = []
    end

    table([["", "Date:", "#{voucher.date.strftime("%B %e, %Y")}"]], cell_style: { size: 10 }, column_widths: [50, 120, 330]) do
      cells.borders = []
    end

    stroke do
      stroke_color '24292E'
      line_width 0.5
      stroke_horizontal_rule
      move_down 5
    end
  end
  def non_discount_amount_details
    if voucher.voucher_amounts.non_discount_amounts.present?
      move_down 10
      text "TAXES AND FEES", size: 11, style: :bold
      table(non_discount_amounts_data, cell_style: { size: 10 }, column_widths: [50, 250, 100]) do
        cells.borders = []
        column(2).align = :right
      end
      table([["", "SUBTOTAL", "#{price(voucher.voucher_amounts.non_discount_amounts.total)}"]],column_widths: [50, 250, 100]) do
        cells.borders = []
        column(2).align = :right
        row(0).font_size = 10


      end
      stroke do
        stroke_color '24292E'
        line_width 0.5
        stroke_horizontal_rule
        move_down 5
      end
    end
  end
  def discount_amount_details
    text "DISCOUNTS", size: 10, style: :bold
    if voucher.voucher_amounts.discount_amounts.present?
      table(discount_amounts_data, cell_style: { size: 10 }, column_widths: [50, 250, 100]) do
        cells.borders = []
        column(2).align = :right
      end
    end
    stroke do
      stroke_color '24292E'
      line_width 0.5
      stroke_horizontal_rule
      move_down 5
    end
    table([["", "TOTAL", "#{price(voucher.voucher_amounts.total_less_discount)}"]],column_widths: [50, 250, 100]) do
      cells.borders = []
      column(2).align = :right
      row(0).font_style = :bold
      row(0).font_size = 12


    end
  end
  def non_discount_amounts_data
    voucher.voucher_amounts.non_discount_amounts.with_non_zero_amounts.map{|a| ["", a.name, price(a.amount)] }
  end

  def discount_amounts_data
    voucher.voucher_amounts.discount_amounts.map{|a| ["", a.name, "- #{price(a.amount)}"] }
  end
  def signatory
    move_down 30
    text "Assessed By:"
    move_down 30
    text "#{voucher.preparer_full_name.upcase}", size: 11, style: :bold
    text "#{voucher.preparer_designation}", size: 10
  end
end
