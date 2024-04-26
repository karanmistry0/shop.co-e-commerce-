class CartItemController < ApplicationController
  before_action :authenticate_user!
  def new
    @cart = CartItem.new
  end

  def create
    @cart = CartItem.new(cart_params)
    if @cart.save
      redirect_to  cart_item_index_path(),notice: "product added to cart"
    else
      redirect_to root_path, alert: "Unable to add product to cart"
    end
  end

  def destroy
    @cart = CartItem.find(params[:id])
    @cart.destroy
    redirect_to cart_item_path
  end

  def index
  end

  private

  def cart_params
    params.permit(:user_id,:product_id,:quantity,:size,:color)
  end
end
