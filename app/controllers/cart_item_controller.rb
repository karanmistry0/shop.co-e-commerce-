class CartItemController < ApplicationController
  before_action :authenticate_user!
  def new
    @cart = CartItem.new
  end

  def create

    existing_cart_items = current_user.cart_items.find_by(product_id: cart_params[:product_id])

    if existing_cart_items
      if (existing_cart_items.size != cart_params[:size] || existing_cart_items.color != cart_params[:color])
        @cart = CartItem.new(cart_params)
        if @cart.save
          redirect_to  cart_item_index_path(),notice: "product added to cart"
        else
          redirect_to root_path, alert: "Unable to add product to cart"
        end
      else
        existing_cart_items.update(quantity: cart_params[:quantity])
        redirect_to cart_item_index_path(), notice:"product updated"
      end
    else
      @cart = CartItem.new(cart_params)
      if @cart.save
        redirect_to  cart_item_index_path(),notice: "product added to cart"
      else
        redirect_to root_path, alert: "Unable to add product to cart"
      end
    end
  end

  def destroy
    @cart = CartItem.find(params[:id])
    @cart.destroy
    redirect_to cart_item_path
  end

  def index
    @cart = current_user.cart_items.all
    @subtotal = sub_total(@cart)
    @subtotaldiscount = discount_total(@cart)
    @deliveryFee = (@subtotal*1)/100
    @totalAmount = ((@subtotal + @deliveryFee).to_d - @subtotaldiscount).to_d
  end

  private

  def cart_params
    params.permit(:user_id,:product_id,:quantity,:size,:color)
  end

  def sub_total(cart_item)
    cart_item.sum{|item| item.quantity * item.product.price}
  end

  def discount_total(cart_item)
    cart_item.sum { |item| item.product.discount ? item.quantity * ( item.product.price.to_d - item.product.discount_price) : 0 }
  end


end
