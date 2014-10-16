class AddCardExpColumn < ActiveRecord::Migration
  def change
    add_column :orders, :card_exp, :date
  end
end
