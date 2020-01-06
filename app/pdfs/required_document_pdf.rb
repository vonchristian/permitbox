class RequiredDocumentPdf < Prawn::Document
  attr_reader :business, :business_requirement, :view_context
  def initialize(business, business_requirement, view_context)
    super(margin: 40, page_size: "A4", page_layout: :portrait)
    @business = business
    @business_requirement = business_requirement
    @view_context = view_context
    title
  end
  def title
    text "#{business_requirement.title.upcase}", style: :bold, size: 18, align: :center
    stroke do
      stroke_color 'CCCCCC'
      line_width 0.2
      stroke_horizontal_rule
      move_down 15
    end
    text "#{business.name}"
  end
end

