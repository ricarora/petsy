class AddRetiredStatus < ActiveRecord::Migration
  def change
        add_column :products, :retired_status, :boolean
  end
end
