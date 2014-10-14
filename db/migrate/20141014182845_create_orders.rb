class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status
      t.integer :total_price
      t.datetime :orderdate
      t.string :name_on_card
      t.integer :card_number
      t.datetime :card_exp
      t.integer :security_code
      t.integer :zip
      t.string :email
      t.string :address
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
