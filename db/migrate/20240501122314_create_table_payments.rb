class CreateTablePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.references :cart_items, null: false, foreign_key: true

      t.timestamps
    end
  end
end
