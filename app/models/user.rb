class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name,presence: true

  has_many :cart_items,dependent: :destroy
  has_many :cart_items_product,through: :cart_items,source: :product,dependent: :destroy
end
