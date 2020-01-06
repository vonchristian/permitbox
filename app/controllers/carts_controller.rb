class CartsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:destroy]
  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to root_url, notice: "Application cancelled successfully."
  end
end
