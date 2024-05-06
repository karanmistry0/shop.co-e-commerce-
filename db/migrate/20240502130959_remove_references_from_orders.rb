class RemoveReferencesFromOrders < ActiveRecord::Migration[7.1]
  def change
    remove_reference :orders,:cart_items_id
  end
end
