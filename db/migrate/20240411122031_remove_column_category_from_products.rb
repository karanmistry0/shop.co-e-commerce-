class RemoveColumnCategoryFromProducts < ActiveRecord::Migration[7.1]
  def change
    remove_column :products,:category,:string
  end
end
