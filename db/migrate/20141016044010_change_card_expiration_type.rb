class ChangeCardExpirationType < ActiveRecord::Migration
  def change
    change_column :orders, :card_exp, :string
  end
end
