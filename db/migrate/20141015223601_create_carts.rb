class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :total

      t.timestamps
    end
  end
end
