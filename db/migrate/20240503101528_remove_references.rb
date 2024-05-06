class RemoveReferences < ActiveRecord::Migration[7.1]
  def change
    remove_column :orders,{:null=>false, :foreign_key=>true},:bigint
  end
end
