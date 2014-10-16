class AddingCartIdColumn < ActiveRecord::Migration
  def change
    add_column :orderitems, :cart_id, :integer
  end
end
