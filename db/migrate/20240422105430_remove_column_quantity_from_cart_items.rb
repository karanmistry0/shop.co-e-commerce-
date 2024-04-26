class RemoveColumnQuantityFromCartItems < ActiveRecord::Migration[7.1]
  def change
    remove_column :cart_items,:quantity,:integer
  end
end
