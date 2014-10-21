class UpdateBuyerIdOrders < ActiveRecord::Migration
  def change
    rename_column :orders, :buyer_id, :user_id
  end
end
