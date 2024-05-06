class AddColumnToCartItems < ActiveRecord::Migration[7.1]
  def change
    add_column :cart_items, :order_id, :bigint
    add_index :cart_items,:order_id
  end
end
