class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @suggested_products = Product.where(product_type: @product.product_type)
  end
end
