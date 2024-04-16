class HomeController < ApplicationController
  def index
    @products = Product.all
    @new_arrival = Category.find_by(name: 'New arrivals').products
    @top_selling = Category.find_by(name: 'Top selling').products
    @reviews = Review.all
  end
end
