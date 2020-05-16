class ApplicationController < ActionController::Base
  include Pundit
  include Pagy::Backend
  protect_from_forgery
  rescue_from Pundit::NotAuthorizedError, with: :permission_denied
  before_action :authenticate_user!
  helper_method :current_locality, :current_voucher, :current_taxpayer, :current_cart

  private
  def current_taxpayer
    if current_taxpayer_account
      current_taxpayer_account.taxpayer
    end
  end

  def current_cart
      Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
      cart = Cart.create!(user: current_user, taxpayer: current_taxpayer)
      session[:cart_id] = cart.id
      cart
  end

  

  def current_locality
    if current_user
      current_user.locality
    end
  end

  def respond_modal_with(*args, &blk)
    options = args.extract_options!
    options[:responder] = ModalResponder
    respond_with *args, options, &blk
  end

  def permission_denied
    redirect_to "/", alert: 'Sorry but you are not allowed to access this page.'
  end
end
