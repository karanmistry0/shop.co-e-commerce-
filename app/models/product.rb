class Product < ApplicationRecord
  belongs_to :category
  validates :name,:description,presence:true
  has_many_attached :images
  monetize :price_cents,allow_nil: true
  has_many :reviews,dependent: :destroy
  after_commit :final_discount_price, on: [:create,:update]

  has_many :cart_items, dependent: :destroy
  has_many :cart_items_users, through: :cart_items,source: :user,dependent: :destroy

  def final_discount_price
    discounted_price = price - (price*(discount_percent.to_f/100))
    update_column(:discount_price,discounted_price)
  end

  def update_final_rating
    final_rating = reviews.average(:rating)
    update_column(:overall_rating,final_rating.to_f)
  end
end
