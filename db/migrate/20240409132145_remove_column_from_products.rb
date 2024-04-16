class RemoveColumnFromProducts < ActiveRecord::Migration[7.1]
  def change
    remove_column :products, :discount_amount, :integer
  end
end
