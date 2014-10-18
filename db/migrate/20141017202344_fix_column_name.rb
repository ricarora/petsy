class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :products, :vendor_id, :user_id
  end
end
