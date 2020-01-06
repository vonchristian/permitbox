module ApplicationHelper
  include Pagy::Frontend
  def devise_mapping
    Devise.mappings[:taxpayer_account]
  end

  def resource_name
    devise_mapping.name
  end

  def resource_class
    devise_mapping.to
  end
  def presenter(object, klass=nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end
end
