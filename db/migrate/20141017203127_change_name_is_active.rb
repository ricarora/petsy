class ChangeNameIsActive < ActiveRecord::Migration
  def change
    rename_column :products, :retired_status, :is_active
  end
end
