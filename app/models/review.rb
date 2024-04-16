class Review < ApplicationRecord
  belongs_to :product, counter_cache: true
  belongs_to :user

  validates :name,presence: true
  validates :description,presence: true
  validates :rating,numericality: {only_integer: true,greater_than_or_equal_to: 1,less_than_or_equal_to: 5}

  after_commit :update_rating,on: [:create,:update]

  def update_rating
    product.update_final_rating
  end
end
