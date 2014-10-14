class CreateOrderitems < ActiveRecord::Migration
  def change
    create_table :orderitems do |t|
      t.integer :qty
      t.integer :totalprice
      t.integer :product_id

      t.timestamps
    end
  end
end
