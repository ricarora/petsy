class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :image_url
      t.integer :stock
      t.integer :vendor_id

      t.timestamps
    end
  end
end
