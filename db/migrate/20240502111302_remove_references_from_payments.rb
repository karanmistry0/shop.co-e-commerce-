class RemoveReferencesFromPayments < ActiveRecord::Migration[7.1]
  def change
    remove_reference :payments,:cart_items,foreign_key: true

  end
end
