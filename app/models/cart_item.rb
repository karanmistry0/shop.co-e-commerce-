class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates :color,presence:true
end
