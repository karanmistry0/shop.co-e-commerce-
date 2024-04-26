class AddColumnsToCartItems < ActiveRecord::Migration[7.1]
  def change
    add_column :cart_items, :size, :string
    add_column :cart_items, :color, :string
  end
end
