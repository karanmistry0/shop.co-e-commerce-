class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.boolean :discount
      t.integer :discount_amount
      t.string :color
      t.string :size

      t.timestamps
    end
  end
end
