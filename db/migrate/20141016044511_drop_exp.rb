class DropExp < ActiveRecord::Migration
  def change
    remove_column :orders, :card_exp, :string
  end
end
