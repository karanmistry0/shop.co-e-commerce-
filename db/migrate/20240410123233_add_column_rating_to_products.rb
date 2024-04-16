class AddColumnRatingToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :overall_rating, :decimal
  end
end
