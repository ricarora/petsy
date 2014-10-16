class UpdateCartsOrderitemsTotalName < ActiveRecord::Migration
  def change
    rename_column :carts, :total, :total_price
    rename_column :orderitems, :totalprice, :total_price
  end
end
